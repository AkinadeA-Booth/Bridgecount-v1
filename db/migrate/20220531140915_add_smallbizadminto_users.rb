class AddSmallbizadmintoUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :smallbiz, :boolean
  end

end
