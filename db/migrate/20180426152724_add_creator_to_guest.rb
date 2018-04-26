class AddCreatorToGuest < ActiveRecord::Migration[5.0]
  def change
    add_column :guests,:creator,:string
  end
end
