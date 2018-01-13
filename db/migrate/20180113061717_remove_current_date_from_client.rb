class RemoveCurrentDateFromClient < ActiveRecord::Migration[5.1]
  def change
  	rename_column :clients, :user_id, :counselor_id
  	
  	remove_column :clients, :currentDate
  	remove_column :clients, :firstName
  end
end
