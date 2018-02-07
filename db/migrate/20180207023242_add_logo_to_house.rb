class AddLogoToHouse < ActiveRecord::Migration[5.0]
  def change
    add_column :houses,:logo,:string
  end
end
