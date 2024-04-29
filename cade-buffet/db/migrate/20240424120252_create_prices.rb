class CreatePrices < ActiveRecord::Migration[7.1]
  def change
    create_table :prices do |t|
      t.integer :base_price_weekdays
      t.integer :min_price_weekdays
      t.integer :additional_person_price_weekdays
      t.integer :extra_event_hour_price_weekdays
      t.integer :base_price_weekend
      t.integer :min_price_weekend
      t.integer :additional_person_price_weekend
      t.integer :extra_event_hour_price_weekend

      t.timestamps
    end
  end
end
