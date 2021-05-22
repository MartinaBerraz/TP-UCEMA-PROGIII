class Prenda < ApplicationRecord
  has_and_belongs_to_many :guardarropas

  enum tipo: [:pantalon, :remera, :pollera, :zapatillas, :camisa, :anteojos, :bufanda]
  enum categoria: [:superior, :inferior, :calzado, :accesorio]
  enum material: [:algodon, :seda, :lino]

end
