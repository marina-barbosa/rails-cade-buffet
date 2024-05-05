class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :code
      t.references :user, null: false, foreign_key: true
      t.references :buffet, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.date :date
      t.integer :guest_count
      t.text :more_details
      t.boolean :event_exclusive_address
      t.text :address
      t.string :status

      t.timestamps
    end
  end
end
