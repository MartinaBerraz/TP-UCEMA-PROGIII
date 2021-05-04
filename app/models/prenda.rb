class Prenda < ApplicationRecord
  enum tipo: [:pantalon, :remera, :pollera, :zapatillas, :camisa, :anteojos, :bufanda]
  enum categoria: [:superior, :inferior, :accesorio]
  enum cprimario: [:rojo, :blanco, :negro]
  enum material: [:algodon, :seda, :lino]
  enum csecundario: [:violeta, :verde, :azul, :rosa, :amarillo]

  validates :descripcion, presence: { message: "Descripción no puede ser un campo vacío"}

end
