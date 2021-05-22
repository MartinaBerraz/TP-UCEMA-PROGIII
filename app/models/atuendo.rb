class Atuendo < ApplicationRecord
  has_and_belongs_to_many :prendas
  enum clasificacion:[1,2,3,4,5,6,7,8,9,10]
  enum etiqueta: [:formal, :informal, :verano, :invierno, :dia, :noche]
  validates :nombre, presence: true
end
