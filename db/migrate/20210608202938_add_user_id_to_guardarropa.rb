class AddUserIdToGuardarropa < ActiveRecord::Migration[6.0]
  def change
    add_column :guardarropas, :user_id, :integer, index:true
  end
end
