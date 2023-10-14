class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  
  validates :email, uniqueness: true

  enum role: %i[client admin]
  
  after_initialize :set_default_role, if: :new_record?
  private
  def set_default_role
    self.role ||= :client
  end
end
