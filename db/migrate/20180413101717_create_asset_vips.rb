class CreateAssetVips < ActiveRecord::Migration[5.0]
  def change
    create_table :asset_vips do |t|
      t.string :name
      t.integer :max_house ,default: 5

      t.timestamps
    end
    add_column :users,:asset_vip_id,:integer
  end
end
