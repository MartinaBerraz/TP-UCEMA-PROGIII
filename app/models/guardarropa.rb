class Guardarropa < ApplicationRecord
  has_and_belongs_to_many :prendas
  has_many :atuendos
  belongs_to :user

  accepts_nested_attributes_for :atuendos
  validates :nombre, presence: true


end

