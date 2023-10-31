class Admin::UsersController < ApplicationController
  include AdminAuthentication
  layout 'admin'
  def index
    @page_title = "CBC Usuarios Registrados"
    @users = User.where(role: 0)
  end
end
