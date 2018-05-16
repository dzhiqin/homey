class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.integer :user_id,:index=>true
      t.string :name
      t.date :birthday
      t.string :location
      t.string :education
      t.string :occupation
      t.date :hiredate
      t.text :slogan
      t.string :job
      t.string :company
      t.string :phone
      t.string :email
      t.string :hometown
      t.timestamps
    end
  end
end
