class AddMapDetailToHouse < ActiveRecord::Migration[5.0]
  def change
    add_column :houses, :cp_lng, :string
    add_column :houses, :cp_lat, :string
  end
end
