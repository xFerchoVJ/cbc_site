class PagesController < ApplicationController
  def index
    @page_title = "CBC Inmobiliaria"
    @properties_sale = Property.where(sale_or_rent: "venta")
    @properties_rent = Property.where(sale_or_rent: "renta")
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
  
end
