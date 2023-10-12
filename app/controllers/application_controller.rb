class ApplicationController < ActionController::Base
  layout :set_layout

  private
  def set_layout
    if current_user&.admin?
      "admin"
    else
      "application"
    end
  end
end
