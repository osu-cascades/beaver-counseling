class AddClientNotNullConstraints < ActiveRecord::Migration[5.1]
  def change
    change_column_null :clients, :first_name, false
    change_column_null :clients, :last_name, false
    change_column_null :clients, :dob, false
    change_column_null :clients, :emergency_name, false
    change_column_null :clients, :emergency_relation, false
    change_column_null :clients, :emergency_address, false
    change_column_null :clients, :emergency_phone, false    
    change_column_null :clients, :health_insurance, false
    change_column_null :clients, :counselor_seen_before, false
    change_column_null :clients, :help_reason, false
  end
end
