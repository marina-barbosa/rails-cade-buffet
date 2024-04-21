class CreateBuffets < ActiveRecord::Migration[7.1]
  def change
    create_table :buffets do |t|
      t.string :commercial_name
      t.string :legal_name
      t.string :cnpj
      t.string :email
      t.string :phone
      t.text :description
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
