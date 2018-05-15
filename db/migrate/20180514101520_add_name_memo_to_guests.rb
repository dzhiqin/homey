class AddNameMemoToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests,:name_memo,:string
    add_index :guests,:status
  end
end
