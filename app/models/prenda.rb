class Prenda < ApplicationRecord
  enum tipo: [:pantalon, :remera, :pollera, :zapatillas, :camisa, :anteojos]
  enum categoria: [:superior, :inferior, :accesorio]
  enum cprimario: [:Blanco, :Negro, :Azul]

end
