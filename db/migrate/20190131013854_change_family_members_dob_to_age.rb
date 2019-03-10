class ChangeFamilyMembersDobToAge < ActiveRecord::Migration[5.2]
  def change
    remove_column :family_members, :dob  
    add_column :family_members, :age, :int8
  end
end
