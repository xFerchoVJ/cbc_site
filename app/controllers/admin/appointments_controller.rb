class Admin::AppointmentsController < ApplicationController

  def index
    @page_title = "CBC Citas"
    @appointments = Appointment.order(completed: :asc)
  end

  def show
    @page_title = "CBC Cita"
    property_id = params[:id]
    @appointments = Appointment.where(property: property_id)
    @property = Property.find(property_id)
  end

  def mark_as_completed
    @appointment = Appointment.find(params[:id])
    @appointment.update(completed: true)
    @appointment.save!
    redirect_to admin_appointments_path
  end

  def mark_as_pending
    @appointment = Appointment.find(params[:id])
    @appointment.update(completed: false)
    @appointment.save!
    redirect_to admin_appointments_path
  end
end