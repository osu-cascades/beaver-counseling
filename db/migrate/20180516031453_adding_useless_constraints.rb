class AddingUselessConstraints < ActiveRecord::Migration[5.1]
  def change
    change_column_null :family_members, :name, false
    change_column_null :family_members, :dob, false
    change_column_null :family_members, :relation, false
    change_column_null :family_members, :client_id, false
  end
end
