class Guardarropa < ApplicationRecord
  has_and_belongs_to_many :prendas
  has_many :atuendos




  validates :nombre, presence: true
end
