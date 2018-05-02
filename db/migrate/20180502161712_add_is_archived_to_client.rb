class AddIsArchivedToClient < ActiveRecord::Migration[5.1]
  def change
      add_column :clients, :is_archived, :boolean
  end
end
