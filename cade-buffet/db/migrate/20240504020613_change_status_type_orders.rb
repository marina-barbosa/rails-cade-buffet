class ChangeStatusTypeOrders < ActiveRecord::Migration[7.1]
  def change
    change_column :orders, :status, :integer
  end
end
