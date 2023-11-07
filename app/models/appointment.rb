class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :property

  validates :name, presence: { message: "El nombre es requerido para agendar la Cita" }
  validates :phone, presence: { message: "El teléfono es requerido para agendar la Cita" },
                    numericality: { message: "El teléfono debe ser un número" },
                    length: {
                      minimum: 10,
                      maximum: 15,
                      too_short: "El teléfono es demasiado corto (mínimo %{count} caracteres)",
                      too_long: "El teléfono es demasiado largo (máximo %{count} caracteres)"
                    }
  validates :date, presence: {message: "La fecha es requerida para agendar la Cita"}
end
