class AddRowOrderToGuests < ActiveRecord::Migration[5.0]
  def change
    add_column :guests,:row_order,:integer
    Guest.find_each do |g|
      g.update(:row_order_position=>:last)
    end
    add_index :guests,:row_order
  end
end
