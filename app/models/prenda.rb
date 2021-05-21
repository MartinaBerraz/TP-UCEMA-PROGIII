class Prenda < ApplicationRecord
  enum tipo: [:pantalon, :remera, :pollera, :zapatillas, :camisa, :anteojos, :bufanda]
  enum categoria: [:superior, :inferior, :calzado, :accesorio]
  enum material: [:algodon, :seda, :lino]

end
