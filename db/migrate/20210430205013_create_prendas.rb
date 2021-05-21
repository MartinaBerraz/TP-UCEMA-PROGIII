class CreatePrendas < ActiveRecord::Migration[6.0]
  def change
    create_table :prendas do |t|
      t.integer :tipo
      t.text :descripcion
      t.integer :categoria
      t.integer :material
      t.text :cprimario
      t.text :csecundario
      t.timestamps
    end
  end
end
