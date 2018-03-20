class FixHouseIdClass < ActiveRecord::Migration[5.0]
  def change
    change_column :houses,:house_id,:string
  end
  House.find_each do |house|
    house.house_id=generate_id
  end
end
