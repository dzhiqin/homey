class AddMoreDetailsToHouse < ActiveRecord::Migration[5.0]
  def change
    add_column :houses,:join_name,:string
    add_column :houses,:bedroom,:string
    add_column :houses,:bathroom,:string
    add_column :houses,:veranda,:string
    add_column :houses,:balcony,:string
    add_column :houses,:refurbishment,:string
    add_column :houses,:lease_plan,:string
    add_column :houses,:indoor_theme,:string
    add_column :houses,:guarantee_rate,:decimal
    add_column :houses,:duration_of_renovation,:string
    add_column :houses,:deposit,:decimal
    add_column :houses,:daily_rent,:decimal
    add_column :houses,:refurbishment_budget,:decimal
    add_column :houses,:maintain_budget,:decimal
    add_column :houses,:overdue_price,:decimal
    add_column :houses,:referral_commission,:decimal
    add_column :houses,:utilities,:decimal
    add_column :houses,:VAT_merchant,:decimal
    add_column :houses,:VAT_personal,:decimal
    add_column :houses,:ROI_lease,:decimal
    add_column :houses,:ROI_guarantee,:decimal
    add_column :houses,:duration_of_lease,:decimal
    add_column :houses,:duration_of_guarantee,:decimal
    add_column :houses,:start_up_cost,:decimal
    add_column :houses,:B_income_rate,:decimal
    add_column :houses,:platform_income_rate,:decimal
    add_column :houses,:retail_monthly_rent_pre_tax,:decimal
    add_column :houses,:retail_guarantee_monthly_income_pre_tax,:decimal
    add_column :houses,:retail_guarantee_monthly_income,:decimal
    add_column :houses,:platform_full_lease_total_income,:decimal
    add_column :houses,:platform_guarantee_total_income,:decimal
    add_column :houses,:B_full_lease_total_income,:decimal
    add_column :houses,:B_guarantee_total_income,:decimal
    add_column :houses,:homey_guarantee_monthly_income_bonus,:decimal
    add_column :houses,:homey_full_lease_total_income,:decimal
    add_column :houses,:homey_guarantee_total_income,:decimal

  end
end
