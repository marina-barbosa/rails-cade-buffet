class AddColumnsToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :final_value, :integer
    add_column :orders, :expiration_date, :date
    add_column :orders, :extra_fee, :integer
    add_column :orders, :discount, :integer
    add_column :orders, :description, :text
    add_column :orders, :payment_method, :string
  end
end
