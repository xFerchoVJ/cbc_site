class Admin::AppointmentsController < ApplicationController

  def index
    @page_title = "CBC Citas"
    @appointments = Appointment.all
  end

  def show
    @page_title = "CBC Cita"
    property_id = params[:id]
    @appointments = Appointment.where(property: property_id)
    @property = Property.find(property_id)
  end
end