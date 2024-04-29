class RemoveMinPriceFromPrice < ActiveRecord::Migration[7.1]
  def change
    remove_column :prices, :min_price_weekdays
    remove_column :prices, :min_price_weekend
  end
end
