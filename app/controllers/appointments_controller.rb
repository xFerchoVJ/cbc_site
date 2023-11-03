class AppointmentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    if params[:date].blank?
      flash[:error] = "Todos los campos son obligatorios."
      redirect_to property_path(params[:property_id])
      return
    end
    date = Date.parse(params[:date])
    existing_appointments = Appointment.find_by(date: date)
    if existing_appointments
      flash[:error] = "Ya existe una cita para esta fecha."
      redirect_to property_path(params[:property_id])
      return
    end
    appointment = Appointment.create(appointment_params)
    if appointment.save
      flash[:success] = "Tu cita se ha registrado correctamente."
      redirect_to property_path(appointment.property_id)
    else
      flash[:error] = "Tu cita no se ha registrado correctamente."
      redirect_to property_path(appointment.property_id)
    end
  end
  
  private

  def appointment_params
    data = {
      name: params[:name],
      phone: params[:phone],
      email: current_user.email,
      user_id: current_user.id || params[:user_id],
      property_id: params[:property_id],
      date: params[:date]
    }
    data
  end
  
end
