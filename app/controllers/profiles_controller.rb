class ProfilesController < ApplicationController
  protect_from_forgery with: :exception
  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = current_user.profile
  end

  def update
  @profile = Profile.find(params[:id])
  if @profile.update(profile_params)
    redirect_to images_path
  else
    render 'edit'
  end
end

private
  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :location, :profile_image)
  end
end
