class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :property

  validates :name, presence: { message: "El nombre es requerido para agendar la Cita" }
  validates :phone, presence: { mesasge: "El telefono es requerido para agendar la Cita" }
  validates :date, presence: {message: "La fecha es requerida para agendar la Cita"}
end
