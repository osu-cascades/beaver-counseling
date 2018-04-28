class RemoveAgeFromFamilyMember < ActiveRecord::Migration[5.1]
  def change
    remove_column :family_members, :age, :string
  end
end
