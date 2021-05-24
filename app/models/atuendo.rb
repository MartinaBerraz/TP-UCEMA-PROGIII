class Atuendo < ApplicationRecord
  has_and_belongs_to_many :prendas
  belongs_to :guardarropa

  accepts_nested_attributes_for :guardarropa
  enum etiqueta: [:formal, :informal, :verano, :invierno, :dia, :noche]
  validates_presence_of :guardarropa
end

