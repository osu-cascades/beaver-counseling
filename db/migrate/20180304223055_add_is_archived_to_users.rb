class AddIsArchivedToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :is_archived, :boolean
  end
end
