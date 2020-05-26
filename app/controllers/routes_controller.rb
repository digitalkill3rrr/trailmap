class RoutesController < ApplicationController
  load_and_authorize_resource
  before_action :set_route, only: [:show, :edit, :update, :destroy, :map_data]

  def index
    @routes = Route.all
  end

  def show
  end

  def new
    @route = current_user.routes.build
  end

  def edit
  end

  def create
    @route = current_user.routes.new(route_params)
    handle_file(params.dig(:route, :track), @route)

    respond_to do |format|
      if @route.save
        format.html { redirect_to @route, notice: 'Route was successfully created.' }
        format.json { render :show, status: :created, location: @route }
      else
        format.html { render :new }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @route.update(route_params)
        format.html { redirect_to @route, notice: 'Route was successfully updated.' }
        format.json { render :show, status: :ok, location: @route }
      else
        format.html { render :edit }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @route.destroy
    respond_to do |format|
      format.html { redirect_to routes_url, notice: 'Route was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def map_data
    @spots = @route.spots.includes(:user, :spot_images)
    render json: { track: @route.track, spots: @spots.map(&:to_map_point) }, status: :ok
  end

  private
    def set_route
      @route = Route.find(params[:id])
    end

    def route_params
      params.require(:route).permit(
        :title,
        :description,
        :difficulty,
        :season,
        :distance,
        :kind,
        :collection_id,
        :cover,
        :takeaway,
        :timetable,
        :warning
      )
    end

    def handle_file(file, route)
      return if file.blank?

      TrackSaver.new(file, route).call
    end
end
