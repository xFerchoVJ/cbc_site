module AdminAuthentication
  extend ActiveSupport::Concern

  included do
    before_action :authenticated_admin!
  end

  private

  def authenticated_admin!
    unless user_signed_in? && current_user.admin?
      flash[:alert] = "Acceso no autorizado."
      redirect_to root_path
    end
  end
end