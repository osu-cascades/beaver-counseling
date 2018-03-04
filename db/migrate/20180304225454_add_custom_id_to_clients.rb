class AddCustomIdToClients < ActiveRecord::Migration[5.1]
  def change
    add_column :clients, :custom_id, :string
  end
end
