class CreateGuestOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :guest_options do |t|
      t.integer :guest_id
      t.integer :option_id

      t.timestamps
    end
  end
end
