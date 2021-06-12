# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
user = User.create! nombre: "user", email: "u@gmail.com", password: "user12345" , admin:false
user2 = User.create! nombre: "Admin1", email: "skiba_florencia@yahoo.com.ar", password: "user12345", admin:true
user3 = User.create! nombre: "Admin4", email: "mateorial22@gmail.com", password: "user12345", admin:true
user4 = User.create! nombre: "Admin3", email: "martuberraz@hotmail.com", password: "user12345", admin:true

vieja = Guardarropa.create! nombre: "Ropa vieja", user_id: user.id
favorita = Guardarropa.create! nombre: "Ropa favorita", user_id: user.id
trabajo = Guardarropa.create! nombre: "Ropa de trabajo", user_id: user.id


remera_para_dormir = Prenda.create! descripcion:"remera de algodon", tipo:1, cprimario:"rosa", csecundario:"rosa", categoria:0, user_id:user.id

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