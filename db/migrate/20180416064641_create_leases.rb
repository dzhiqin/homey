class CreateLeases < ActiveRecord::Migration[5.0]
  def change
    create_table :leases do |t|
      t.decimal :charter_costs
      t.decimal :B_guarantee_yearly_income
      t.decimal :platform_guarantee_yearly_income
      t.decimal :homey_guarantee_yearly_income_bonus
      t.integer :house_id,:index=>true

      t.timestamps
    end
  end
end
