class AddContactNameToHouses < ActiveRecord::Migration[5.0]
  def change
    add_column :houses,:contact_name,:string
  end
end
