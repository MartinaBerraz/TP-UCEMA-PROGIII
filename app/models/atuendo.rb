class Atuendo < ApplicationRecord
  has_and_belongs_to_many :prendas

  validates :nombre, presence: true
end
