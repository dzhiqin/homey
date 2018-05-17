class CreateRenters < ActiveRecord::Migration[5.0]
  def change
    create_table :renters do |t|
      t.decimal :rental_price
      t.string :address
      t.string :name
      t.decimal :budget
      t.decimal :budget_rental_ratio
      t.timestamps

      
    end
  end
end
