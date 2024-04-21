class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.string :street
      t.string :number
      t.string :neighborhood
      t.string :state
      t.string :city
      t.string :zip_code

      t.timestamps
    end
  end
end
