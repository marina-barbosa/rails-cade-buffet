class AddBuffetIdToEvent < ActiveRecord::Migration[7.1]
  def change
    add_reference :events, :buffet, null: true, foreign_key: true
  end
end
