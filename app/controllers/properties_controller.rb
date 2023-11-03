class PropertiesController < ApplicationController
  def index
    @page_title = "CBC Propiedades"
    @properties = Property.all
  end

  def show
    @page_title = "CBC Propiedad"
    @property = Property.find(params[:id])
    @disabled_dates = get_disabled_dates
  end
    
  def get_disabled_dates
    occupied_dates = Appointment.where(property_id: params[:id]).pluck(:date)
    formatted_occupied_dates = occupied_dates.map { |date_str| DateTime.parse(date_str).strftime("%Y-%m-%d %H:%M") }
    formatted_occupied_dates.to_json
  end
end