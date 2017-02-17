class ProfilesController < ApplicationController
  protect_from_forgery with: :exception
  def show
    @profile = Profile.find(params[:id])
    @images = @profile.images
  end

  def edit
    @profile = Profile.find_by_user_id(current_user.id)
  end

  def update
  @profile = Profile.find(params[:id])
  if @profile.update(profile_params)
    flash[:notice] = "Successfully updated profile"
    redirect_to profile_images_path(@profile)
  end
end

private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :location, :profile_image)
  end
end
