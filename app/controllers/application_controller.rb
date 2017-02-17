class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def after_sign_in_path_for(resource_or_scope)
    if current_user.has_profile
      id = current_user.profile.id
      profile_images_path(id)
    else
      id = current_user.profile.id
      edit_profile_path(id)
    end
  end
end
