class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.integer :min_people
      t.integer :max_people
      t.integer :default_event_duration_minutes
      t.boolean :alcoholic_drinks
      t.boolean :decoration
      t.boolean :parking_service
      t.boolean :valet
      t.boolean :exclusive_buffet_location
      t.references :price, null: false, foreign_key: true

      t.timestamps
    end
  end
end
