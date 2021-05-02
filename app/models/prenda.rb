class Prenda < ApplicationRecord
  enum tipo: [:pantalon, :remera, :pollera, :zapatillas, :camisa, :anteojos, :bufanda]
  enum categoria: [:superior, :inferior, :accesorio]
  enum cprimario: [:rojo, :verde, :azul]
  enum material: [:algodon, :seda, :lino]
end
