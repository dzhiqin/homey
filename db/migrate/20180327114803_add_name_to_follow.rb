class AddNameToFollow < ActiveRecord::Migration[5.0]
  def change
    add_column :follows ,:name,:string
  end
end
