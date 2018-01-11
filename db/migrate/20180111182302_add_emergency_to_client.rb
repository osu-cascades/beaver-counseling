class AddEmergencyToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :emergency_name, :string
    add_column :clients, :emergency_relation, :string
    add_column :clients, :emergency_address, :string
    add_column :clients, :emergency_phone, :string
  end
end
