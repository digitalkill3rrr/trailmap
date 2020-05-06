class SpotImagesController < ApplicationController
  before_action :set_spot_image, only: [:show, :edit, :update, :destroy]

  def index
    @spot_images = SpotImage.all
  end

  def show
  end

  def new
    @spot_image = SpotImage.new
  end

  def edit
  end

  def create
    @spot_image = SpotImage.new(spot_image_params)

    respond_to do |format|
      if @spot_image.save
        format.html { redirect_to @spot_image, notice: 'Spot image was successfully created.' }
        format.json { render :show, status: :created, location: @spot_image }
      else
        format.html { render :new }
        format.json { render json: @spot_image.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @spot_image.update(spot_image_params)
        format.html { redirect_to @spot_image, notice: 'Spot image was successfully updated.' }
        format.json { render :show, status: :ok, location: @spot_image }
      else
        format.html { render :edit }
        format.json { render json: @spot_image.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @spot_image.destroy
    respond_to do |format|
      format.html { redirect_to spot_images_url, notice: 'Spot image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_spot_image
      @spot_image = SpotImage.find(params[:id])
    end

    def spot_image_params
      params.require(:spot_image).permit(:spot_id, :image)
    end
end
