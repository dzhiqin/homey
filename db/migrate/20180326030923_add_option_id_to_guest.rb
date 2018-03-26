class AddOptionIdToGuest < ActiveRecord::Migration[5.0]
  def change
    add_column :guests,:option_id,:string
  end
end
