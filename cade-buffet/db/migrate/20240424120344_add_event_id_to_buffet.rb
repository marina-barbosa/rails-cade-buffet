class AddEventIdToBuffet < ActiveRecord::Migration[7.1]
  def change
    add_reference :buffets, :event, null: true, foreign_key: true
  end
end
