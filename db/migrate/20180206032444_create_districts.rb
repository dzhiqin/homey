class CreateDistricts < ActiveRecord::Migration[5.0]
  def change
    create_table :districts do |t|
      t.string :name

      t.timestamps
    end
    add_column :houses,:district_id,:integer
    add_index :houses,:district_id
  end
end
