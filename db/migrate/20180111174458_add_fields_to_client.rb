class AddFieldsToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :currentDate, :datetime
    add_column :clients, :firstName, :string
    add_column :clients, :lastName, :string
    add_column :clients, :dob, :datetime
    add_column :clients, :phoneNumber, :string
    add_column :clients, :leaveMessage, :boolean
    add_column :clients, :email, :string
    add_column :clients, :occupation, :string
    add_column :clients, :employer, :string
    add_column :clients, :employerAddress, :string
    add_column :clients, :workPhone, :string
    add_column :clients, :leaveMessageWork, :boolean
  end
end
