class ApplicationController < ActionController::Base
  layout :set_layout

  def after_sign_in_path_for(resource)
    if current_user.role == "admin"
      admin_properties_path
    else
      root_path
    end
  end

  private
  def set_layout
    if current_user&.admin?
      "admin"
    else
      "application"
    end
  end
end
