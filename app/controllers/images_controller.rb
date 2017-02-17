class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    @profile = Profile.find(params[:profile_id])
    @image = @profile.images.new()
  end

  def create
    @profile = Profile.find(params[:profile_id])
    @image = @profile.images.new(image_params)
    if @image.save
      flash[:notice] = "Photo successfully uploaded"
      redirect_to profile_images_path
    else
      flash[:notice] = "Eat a dick"
      render 'new'
    end
  end

private
  def image_params
    params.require(:image).permit(:image_post, :profile_id)
  end
end
