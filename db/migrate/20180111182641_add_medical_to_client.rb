class AddMedicalToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :health_insurance, :boolean
    add_column :clients, :insurance_company, :string
    add_column :clients, :physician, :string
    add_column :clients, :physician_phone, :string
    add_column :clients, :medication, :string
    add_column :clients, :counselor_seen_before, :boolean
    add_column :clients, :counselor_seen, :string
    add_column :clients, :help_reason, :string
  end
end
