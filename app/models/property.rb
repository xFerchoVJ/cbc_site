class Property < ApplicationRecord
  has_many_attached :images
  enum property_type: [:casa, :terreno, :departamento, :bodega] 

  validates :property_type, presence: { message: "El tipo de Propiedad es obligatorio" }
  validates :name, presence: {message: "El titulo de la Propiedad es obligatorio" }
  validates :direction, presence: { message: "la dirección de la Propiedad es obligatorio"}
  validates :price, presence: { message: "el precio de la Propiedad es obligatorio"}
  validates :square_meter, presence: { message: "los metros cuadrados de la Propiedad es obligatorio"}
  validates :beds, presence: { message: "la cantidad de cuartos de la Propiedad es obligatorio"}
  validates :bathrooms, presence: { message: "la cantidad de baños de la Propiedad es obligatorio"}
end
