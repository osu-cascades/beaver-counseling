class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.integer :session_number
      t.string :client_name
      t.string :counselor_name
      t.string :status
      t.text :content
      t.integer :client_id

      t.timestamps
    end
    add_index :notes, :client_id
  end
end
