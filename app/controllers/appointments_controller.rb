class AppointmentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    
    binding.pry
      
    @appointment = Appointment.new(appointments_params)
    @appointment.email = current_user.email
    @appointment.user = current_user
    @appointment.property = params[:id]
    @property = Property.find(@appointment.property_id)
  end

  private

  def appointments_params
    params.require(:appointment).permit(:name, :phone, :email, :user_id, :property_id)
  end
  
end
