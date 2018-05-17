class AddGuestIdToRenter < ActiveRecord::Migration[5.0]
  def change
    add_column :renters,:guest_id,:integer
    add_column :renters,:rental_from,:date
    add_column :renters,:rental_to,:date
    add_column :renters,:rental_duration,:string
    add_column :renters,:rental_square,:decimal
    add_index :renters,:guest_id
  end
end
