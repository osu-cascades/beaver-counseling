class RenameFirstNameInClientToFirstName < ActiveRecord::Migration[5.1]
  def change
  	rename_column :clients, :lastName, :last_name
  	rename_column :clients, :phoneNumber, :phone_number
  	rename_column :clients, :leaveMessage, :leave_message
  	rename_column :clients, :employerAddress, :employer_address
  	rename_column :clients, :workPhone, :work_phone
  	rename_column :clients, :leaveMessageWork, :leave_message_work
  end
end
