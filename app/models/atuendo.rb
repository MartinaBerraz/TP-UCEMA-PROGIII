class Atuendo < ApplicationRecord
  has_and_belongs_to_many :prendas
  belongs_to :guardarropas

  enum etiqueta: [:formal, :informal, :verano, :invierno, :dia, :noche]
  validates :nombre, presence: true
end
