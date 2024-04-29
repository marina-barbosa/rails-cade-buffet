class RemoveEventIdFromBuffet < ActiveRecord::Migration[7.1]
  def change
    remove_column :buffets, :event_id
  end
end
