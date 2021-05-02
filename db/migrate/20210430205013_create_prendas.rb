class CreatePrendas < ActiveRecord::Migration[6.0]
  def change
    create_table :prendas do |t|
      t.integer :tipo
      t.text :descripcion
      t.integer :categoria
      t.integer :material
      t.integer :cprimario
      t.integer :csecundario

      t.timestamps
    end
  end
end
