class ImagesController < ApplicationController
  protect_from_forgery with: :exception
  def index
    @images = Image.all
  end

  def new
    @image = Image.new
    @profile = Profile.find(params[:profile_id])
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @image = @profile.images.new(image_params)
    if @profile.save
      redirect_to profile_images_path
    else
      render 'new'
    end
  end

private
  def image_params
    params.require(:image).permit(:image_post)
  end
end
