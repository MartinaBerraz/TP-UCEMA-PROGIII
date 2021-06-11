class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :prendas
  has_many :guardarropas

  validates :password, length: { minimum: 8, maximum: 16 }

  def admin?
    admin
  end
end
