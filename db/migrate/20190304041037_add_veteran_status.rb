class AddVeteranStatus < ActiveRecord::Migration[5.2]
  def change
  	add_column :clients, :is_veteran, :boolean, default: false
  end
end
