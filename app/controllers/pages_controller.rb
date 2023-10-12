class PagesController < ApplicationController
  def index
    @page_title = "CBC Inmobiliaria"
  end

  def about
    @page_title = "CBC Nosotros"
  end
end
