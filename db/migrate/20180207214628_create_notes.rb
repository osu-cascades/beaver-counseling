class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.string :counselorName
      t.string :clientName
      t.integer :session
      t.string :content

      t.timestamps
    end
  end
end
