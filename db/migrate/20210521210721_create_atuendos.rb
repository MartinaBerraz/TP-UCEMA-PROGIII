class CreateAtuendos < ActiveRecord::Migration[6.0]
  def change
    create_table :atuendos do |t|
      t.text :nombre

      t.integer :clasificacion
      t.integer :etiqueta

      t.timestamps
    end
  end
end
