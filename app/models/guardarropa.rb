class Guardarropa < ApplicationRecord
  has_and_belongs_to_many :prendas
end
