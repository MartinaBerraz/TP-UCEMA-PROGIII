class AddGuardarropasPrendas < ActiveRecord::Migration[6.0]
  def change
    create_table :guardarropas_prendas, id: false do |t|
      t.belongs_to :guardarropa
      t.belongs_to :prenda
    end
  end
end
