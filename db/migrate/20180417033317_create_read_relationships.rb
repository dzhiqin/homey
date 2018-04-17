class CreateReadRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :read_relationships do |t|
      t.integer :user_id ,:index=>true
      t.integer :house_id ,:index=>true 
      t.timestamps
    end
  end
end
