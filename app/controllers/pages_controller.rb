class PagesController < ApplicationController
  def index
    @page_title = "CBC Inmobiliaria"
    @properties_sale = Property.where(sale_or_rent: "venta")
    @properties_rent = Property.where(sale_or_rent: "renta")
  end

  def about
    @page_title = "CBC Nosotros"
  end
end
