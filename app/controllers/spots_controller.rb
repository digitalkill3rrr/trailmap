class SpotsController < ApplicationController
  load_and_authorize_resource
  before_action :set_spot, only: [:show, :edit, :update, :destroy]

  def index
    @spots = Spot.all
  end

  def show
    @spot = Spot.find(params[:id])
    @related_spots = @spot.find_related_tags

    if user_signed_in?
      @spot.user_id = current_user.id
    end
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
    @spot = current_user.spots.new(spot_params)

    respond_to do |format|
      if @spot.save
        if params[:spot_images].present?
          params[:spot_images][:image].each do |image|
            @spot.spot_images.create(image: image)
          end
        end

        format.html { redirect_to @spot, notice: 'Spot was successfully created.' }
        format.json { render :show, status: :created, location: @spot }
      else
        format.html { render :new }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @spot.update(spot_params)
        if params[:spot_images].present?
          params[:spot_images][:image].each do |image|
            @spot.spot_images.update(image: image)
          end
        end

        format.html { redirect_to @spot, notice: 'Spot was successfully updated.' }
        format.json { render :show, status: :ok, location: @spot }
      else
        format.html { render :edit }
        format.json { render json: @spot.errors, status: :unprocessable_entity }
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

    def spot_params
      params.require(:spot).permit(:name, :description, :tag_list, :route_id, :longitude, :latitude, :status, :images, spot_images_attributes: ["image", "@original_filename", "@content_type", "@headers", "_destroy", "id"] )
    end
end
