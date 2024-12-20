class PagesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:filter]

  def index
    @page_title = "CBC Inmobiliaria"
    @properties_sale = Property.where(sale_or_rent: "venta").limit(3)
    @properties_rent = Property.where(sale_or_rent: "renta").limit(3)
  end

  def about
    @page_title = "CBC Nosotros"
  end

  def contact
    @page_title = "CBC Contacto"
  end

  def send_contact_message
    @name = params[:contact_form][:name]
    @email = params[:contact_form][:email]
    @subject = params[:contact_form][:subject]
    @message = params[:contact_form][:message]

    if @name.empty? || @email.empty? || @subject.empty? || @message.empty?
      flash[:error] = "Todos los campos son obligatorios"
      return
    end
       
    # Envía el correo y obtén el resultado de la entrega
    contact = NotifierMailer.contact_message(@name, @email, @subject, @message).deliver_later
    if contact
      puts "Se envio"
    else
      puts "No se envio"
    end
    flash[:success] = "El correo se ha enviado correctamente."
    redirect_to contacto_path
  end

  def filter
    @keyword = params[:keyword]
    @property_type = params[:property_type]
    @sale_or_rent = params[:sale_or_rent]
    @properties = Property.filter(@keyword, @property_type, @sale_or_rent)
    render partial: "properties/properties_list", locals: { properties: @properties }
  end
end
