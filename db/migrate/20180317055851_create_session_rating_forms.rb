class CreateSessionRatingForms < ActiveRecord::Migration[5.1]
  def change
    create_table :session_rating_forms do |t|
      t.string :client_number
      t.date :date
      t.integer :room_num
      t.integer :effectiveness
      t.integer :focus
      t.integer :relationship
      t.integer :care
      t.integer :start_stress
      t.integer :end_stress
      t.string :optional_info

      t.timestamps
    end
  end
end
