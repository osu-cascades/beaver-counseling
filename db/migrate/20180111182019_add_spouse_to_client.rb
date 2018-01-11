class AddSpouseToClient < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :spouse_first_name, :string
    add_column :clients, :spouse_last_name, :string
    add_column :clients, :spouse_dob, :datetime
    add_column :clients, :spouse_occupation, :string
    add_column :clients, :spouse_employer, :string
    add_column :clients, :spouse_phone, :string
  end
end
