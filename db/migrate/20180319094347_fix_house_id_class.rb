class FixHouseIdClass < ActiveRecord::Migration[5.0]
  def change
    change_column :houses,:house_id,:string
  end
  
end
