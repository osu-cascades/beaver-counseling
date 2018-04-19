class RemoveAgeFromClients < ActiveRecord::Migration[5.1]
  def change
    remove_column :clients, :age, :integer
  end
end
