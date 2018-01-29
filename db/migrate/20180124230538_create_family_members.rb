class CreateFamilyMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :family_members do |t|
      t.string :name
      t.string :age
      t.string :dob
      t.string :relation

      t.timestamps
    end
  end
end
