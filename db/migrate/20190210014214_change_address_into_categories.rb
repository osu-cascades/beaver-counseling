class ChangeAddressIntoCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :clients, :local_address

    add_column :clients, :local_street, :string
    add_colum :clients, :local_city, :string
    add_colum :clients, :local_state, :string
    add_colum :clients, :local_zipcode, :int8
  end
end
