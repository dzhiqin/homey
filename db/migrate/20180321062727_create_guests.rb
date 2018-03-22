class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.string :name
      t.string :country_code
      t.string :job
      t.string :email
      t.string :wechat
      t.string :phone
      t.string :company
      t.string :referrer
      t.string :house_options
      t.string :house_district
      t.string :house_type
      t.string :liked_estate
      t.string :landscape
      t.string :house_floor
      t.string :house_parking
      t.string :house_furnished
      t.string :house_XIS
      t.date   :check_in_date
      t.string :duration
      t.string :budget
      t.string :has_pet
      t.string :want_buy
      t.string :other_requests
      t.string :status
      t.integer :approach_id
      t.string :approach
      t.timestamps
    end
  end
end
