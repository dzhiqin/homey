class CreateFollows < ActiveRecord::Migration[5.0]
  def change
    create_table :follows do |t|
      t.integer :guest_id
      t.integer :user_id
      t.date :last_follow_date
      t.string :memo

      t.timestamps
    end
    remove_column :guests,:option_id
  end
end
