class AddClientIdToFamilyMember < ActiveRecord::Migration[5.1]
  def change
    add_column :family_members, :client_id, :integer
  end
end
