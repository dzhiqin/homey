class ChangeColumnContactInHouse < ActiveRecord::Migration[5.0]
  def change
    change_column :houses,:contact_phone,:string
  end
end
