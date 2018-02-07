class CreateHouseImages < ActiveRecord::Migration[5.0]
  def change
    create_table :house_images do |t|
      t.integer :house_id,:index=>true
      t.string :image
      t.string :description
      t.timestamps
    end
  end
end
