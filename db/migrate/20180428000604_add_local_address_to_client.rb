class AddLocalAddressToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :local_address, :string
    add_column :clients, :phone_type, :int
    add_column :clients, :email_leave_message, :boolean

    remove_column :clients, :employer_address
    remove_column :clients, :work_phone
    remove_column :clients, :leave_message_work
    remove_column :clients, :spouse_first_name
    remove_column :clients, :spouse_last_name
    remove_column :clients, :spouse_dob
    remove_column :clients, :spouse_occupation
    remove_column :clients, :spouse_employer
    remove_column :clients, :spouse_phone
    remove_column :clients, :emergency_address
    remove_column :clients, :health_insurance
    remove_column :clients, :help_reason    

    add_column :clients, :highest_edu, :string
    add_column :clients, :identified_gender, :string
    add_column :clients, :culture_background, :string
    add_column :clients, :sexual_orientation, :string
    add_column :clients, :relationship, :string

    add_column :clients, :how_referred, :string
    add_column :clients, :accepted, :bool
    add_column :clients, :referral_to, :string
  end
end
