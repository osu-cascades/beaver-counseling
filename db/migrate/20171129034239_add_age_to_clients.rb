class AddAgeToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :age, :integer
  end
end
