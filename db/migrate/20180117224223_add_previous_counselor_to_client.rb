class AddPreviousCounselorToClient < ActiveRecord::Migration[5.1]
  def change
  	add_column :clients, :previous_counselor, :string, array: true, default:[]
  end
end