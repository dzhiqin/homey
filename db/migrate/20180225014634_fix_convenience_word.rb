class FixConvenienceWord < ActiveRecord::Migration[5.0]
  def change
    rename_column :houses,:transportation_convinence,:transportation_convenience
    rename_column :houses,:shopping_convinence,:shopping_convenience
    rename_column :houses,:medical_convinence,:medical_convenience
  end
end
