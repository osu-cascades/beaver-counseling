class SplitAddressIntoCategories < ActiveRecord::Migration[5.2]
  def change
    remove_column :clients, :local_address

    add_column :clients, :local_street, :varchar
    add_column :clients, :local_city, :varchar
    add_column :clients, :local_state, :varchar
    add_column :clients, :local_zipcode, :int8
  end
end
