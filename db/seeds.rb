# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
user1 = User.create! nombre: "user1", email: "mb@gmail.com", password: "user123"

vieja = Guardarropa.create! nombre: "Ropa vieja"
favorita = Guardarropa.create! nombre: "Ropa favorita"
trabajo = Guardarropa.create! nombre: "Ropa de trabajo"

vieja.user_id = user1.id
favorita.user_id = user1.id
trabajo.user_id = user1.id

remera_para_dormir = Prenda.create! descripcion:"remera de algodon", tipo:1, cprimario:"rosa", csecundario:"rosa", categoria:0

remera_para_dormir.user_id = user1.id
vieja.prendas << remera_para_dormir
favorita.prendas << remera_para_dormir

#pantalon_trabajo = Prenda.create! descripcion:"pantalon de jean", tipo:2, cprimario:"rosa", csecundario:"rosa", categoria:1

#trabajo.prendas << pantalon_trabajo
#favorita.prendas << pantalon_trabajo

#favorita.prendas.create! descripcion:"Camisa larga", tipo:4, cprimario:"rosa", csecundario:"azul", categoria:0
#favorita.prendas.create! descripcion:"Zapatillas converse", tipo:3, cprimario:"azul", csecundario:"rosa", categoria:2
#vieja.prendas.create! descripcion:"Pantalon de vestir", tipo:1, cprimario:"rosa", csecundario:"azul", categoria:1
#vieja.prendas.create! descripcion:"Remera con flores", tipo:2, cprimario:"azul", csecundario:"rosa", categoria:0
#trabajo.prendas.create! descripcion:"Bufanda lisa", tipo:1, cprimario:"azul", csecundario:"rosa", categoria:3
#trabajo.prendas.create! descripcion:"Anteojos de sol", tipo:3, cprimario:"azul", csecundario:"rosa", categoria:3

#Atuendo.create!(nombre:"Atuendo de fiesta", clasificacion:10, etiqueta:0,guardarropa_id:1)