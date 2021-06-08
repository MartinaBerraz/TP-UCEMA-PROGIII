class AddUserIdToPrenda < ActiveRecord::Migration[6.0]
  def change
    add_column :prendas, :user_id, :integer, index:true
  end
end
