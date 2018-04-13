class AddRoleFlagToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users,:is_admin,:boolean,default:false
    add_column :users,:is_employee,:boolean,default:false
    add_column :users,:is_art,:boolean,default:false
    add_column :users,:is_housekeeper,:boolean,default:false
    add_column :users,:is_cmanager,:boolean,default:false
    add_column :users,:is_overseer,:boolean,default:false
    add_column :users,:is_salesman,:boolean,default:false
    add_column :users,:is_salesman_p,:boolean,default:false
    add_column :users,:is_imanager,:boolean,default:false
    add_column :users,:is_imanager_p,:boolean,default:false
    add_column :users,:is_acc,:boolean,default:false
    add_column :users,:is_hr,:boolean,default:false
    add_column :users,:is_design_director,:boolean,default:false
    add_column :users,:is_design_assitant,:boolean,default:false
    add_column :users,:is_rental_user,:boolean,default:false
    add_column :users,:is_asset_user,:boolean,default:false

  end
end
