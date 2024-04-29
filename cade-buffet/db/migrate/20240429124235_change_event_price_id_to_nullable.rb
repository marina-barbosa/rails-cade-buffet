class ChangeEventPriceIdToNullable < ActiveRecord::Migration[7.1]
  def change
    change_column :events, :price_id, :integer, null: true
  end
end
