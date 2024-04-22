class ChangeBuffetNullConstraints < ActiveRecord::Migration[7.1]
  def change
    change_column :buffets, :address_id, :integer, null: true
    change_column :buffets, :payment_methods_id, :integer, null: true
  end
end
