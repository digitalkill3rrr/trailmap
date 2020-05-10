class SpotsController < ApplicationController
  load_and_authorize_resource
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  def index
    respond_to do |format|
      format.html { @spots = Spot.all }
      format.json do
        @spots = Spot.includes(:user, :spot_images).where(route_id: params[:route_id]).order(:id).to_a
        @spots << Spot.new(route_id: params[:route_id], user_id: current_user.id)
        authorize! :manage, Spot
        @ability = Ability.new(current_user)
      end
    end
  end

  def show
    @spot = Spot.find(params[:id])
    @related_spots = @spot.find_related_tags
    @spot.user_id = current_user.id if user_signed_in?
  end

  def tagged
    if params[:tag].present?
      @spots = Spot.tagged_with(params[:tag])
      @tag = params[:tag]
    else
      @spots = Spot.all
    end
  end

  def new
    @spot = current_user.spots.build
    @spot.spot_images.build
  end

  def edit
  end

  def create
    handle_tag_list
    @spot = current_user.spots.new(spot_params)

    respond_to do |format|
      if @spot.save
        format.html { redirect_to @spot, notice: 'Spot was successfully created.' }
        format.json do
          authorize! :manage, @spot
          @ability = Ability.new(current_user)
          render :show, status: :created
        end
      else
        format.html { render :new }
        format.json do
          authorize! :manage, @spot
          @ability = Ability.new(current_user)
          render :show, status: :unprocessable_entity
        end
      end
    end
  end

  def update
    handle_tag_list

    respond_to do |format|
      if @spot.update(spot_params)
        format.html { redirect_to @spot, notice: 'Spot was successfully updated.' }
        format.json do
          authorize! :manage, @spot
          @ability = Ability.new(current_user)
          render :show, status: :ok
        end
      else
        format.html { render :edit }
        format.json do
          authorize! :manage, @spot
          @ability = Ability.new(current_user)
          render :show, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @spot.destroy
    respond_to do |format|
      format.html { redirect_to spots_url, notice: 'Spot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_spot
      @spot = Spot.find(params[:id])
    end

    def handle_tag_list
      return unless params[:spot][:tag_list]

      params[:spot][:tag_list] =
        params[:spot][:tag_list].split('#').reject(&:blank?).map{ |p| '#' + p.strip }
    end

    def spot_params
      params.require(:spot).permit(
        :name,
        :description,
        :route_id,
        :longitude,
        :latitude,
        :status,
        :images,
        tag_list: [],
        spot_images_attributes: [
          "image", "@original_filename", "@content_type", "@headers", "_destroy", "id"
        ]
      )
    end
end
