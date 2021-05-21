class AddAtuendosPrendas < ActiveRecord::Migration[6.0]
  def change
    create_table :atuendos_prendas, id: false do |t|
      t.belongs_to :atuendo
      t.belongs_to :prenda
    end
  end
end
