class AddIsDuplexToHouse < ActiveRecord::Migration[5.0]
  def change
    add_column :houses,:is_duplex,:boolean,default:false
    add_column :houses,:floor_height,:decimal
  end
end
