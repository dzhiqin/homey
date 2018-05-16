class CreateSalaries < ActiveRecord::Migration[5.0]
  def change
    create_table :salaries do |t|
      t.integer :user_id
      t.decimal :workdays,:default=>0
      t.decimal :attendance_days,:default=>0
      t.decimal :full_attendance_bonus,:default=>0
      t.decimal :leave_days,:default=>0
      t.decimal :holiday,:default=>0
      t.decimal :basic_wage,:default=>0
      t.decimal :post_wage,:default=>0
      t.decimal :subsidy,:default=>0
      t.decimal :bonus,:default=>0
      t.decimal :performance_fee,:default=>0
      t.decimal :salary,:default=>0
      t.decimal :endowment_insurance,:default=>0
      t.decimal :medical_insurance,:default=>0
      t.decimal :jobless_insurance,:default=>0
      t.decimal :housing_fund,:default=>0
      t.decimal :tax,:default=>0
      t.decimal :actual_salary,:default=>0
      t.date :salary_date
      t.string :name
      t.timestamps
    end
  end
end
