class Property < ApplicationRecord
  has_many_attached :images
  enum property_type: [:casa, :terreno, :departamento, :bodega] 
  enum sale_or_rent: { venta: true, renta: false }

  validates :property_type, presence: { message: "El tipo de Propiedad es obligatorio" }
  validates :name, presence: {message: "El titulo de la Propiedad es obligatorio" }
  validates :direction, presence: { message: "la dirección de la Propiedad es obligatorio"}
  validates :price, presence: { message: "el precio de la Propiedad es obligatorio"}
  validates :square_meter, presence: { message: "los metros cuadrados de la Propiedad es obligatorio"}
  validates :beds, presence: { message: "la cantidad de cuartos de la Propiedad es obligatorio"}
  validates :bathrooms, presence: { message: "la cantidad de baños de la Propiedad es obligatorio"}
  validates :sale_or_rent, presence: {message: "indicar la si es renta o venta de la Propiedad es obligatorio"}

  def self.filter(keyword, property_type, sale_or_rent)
    properties = all
    properties = properties.where("name LIKE ?", "%#{keyword}%") if keyword.present?
    properties = properties.where(property_type: property_type) if property_type.present?
    properties = properties.where(sale_or_rent: sale_or_rent) if sale_or_rent.present?
    properties
  end
end
