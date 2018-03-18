class AddPasswordChangedAtToUsers < ActiveRecord::Migration[5.1]
  def change
  	t.datetime :password_changed_at
  end
end
