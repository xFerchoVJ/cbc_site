class Admin::UsersController < ApplicationController
  include AdminAuthentication
  layout 'admin'
  def index
    @page_title = "CBC Usuarios Registrados"
    @users = User.where(role: 0)
                 .includes(:appointments)
                 .sort_by { |user| user.appointments.empty? ? 1 : 0 }
  end
end
