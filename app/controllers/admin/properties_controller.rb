class Admin::PropertiesController < ApplicationController
  before_action :set_property, only: %i[ show edit update destroy ]
  include AdminAuthentication
  layout 'admin'

  # GET /admin/properties or /admin/properties.json
  def index
    @page_title = "CBC Propiedades"
    @properties = Property.paginate(page: params[:page], per_page: 10)
  end

  # GET /admin/properties/1 or /admin/properties/1.json
  def show
    @page_title = "CBC Propiedad"
  end

  # GET /admin/properties/new
  def new
    @page_title = "CBC Nueva Propiedad"
    @property = Property.new
  end

  # GET /admin/properties/1/edit
  def edit
    @page_title = "CBC Editar Propiedad"
  end

  # POST /admin/properties or /admin/properties.json
  def create
    @property = Property.new(property_params)

    respond_to do |format|
      if @property.save
        format.html { redirect_to admin_properties_path, notice: "La Propiedad fue creada correctamente." }
        format.json { render :show, status: :created, location: @property }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/properties/1 or /admin/properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        if params[:property][:image_ids].present?
          imgs_ids_to_purge = params[:property][:image_ids].map(&:to_i)
          @property.images.where(id: imgs_ids_to_purge).purge
        end

        format.html { redirect_to admin_property_path(@property), notice: "La propiedad fue editada correctamente." }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/properties/1 or /admin/properties/1.json
  def destroy
    @property.destroy

    respond_to do |format|
      format.html { redirect_to admin_properties_path, notice: "La Propiedad ha sido eliminada correctamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      @property = Property.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_params
      params.require(:property).permit(:name, :direction, :price, :square_meter, :beds, :bathrooms, :property_type, :sale_or_rent, images: [])
    end
end
