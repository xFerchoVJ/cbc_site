class Admin::DashboardController < ApplicationController
  layout 'admin'
  before_action :authenticated_admin!
	
  private
  def authenticated_admin!
    unless user_signed_in? && current_user.admin?
      flash[:alert] = "Acceso no autorizado."
      redirect_to root_path
    end
  end
end
