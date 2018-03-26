class CreateReferGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :refer_guests do |t|
      t.string :name
      t.string :contact
      t.integer :guest_id

      t.timestamps
    end
  end
end
