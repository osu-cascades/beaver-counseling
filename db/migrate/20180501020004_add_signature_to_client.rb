class AddSignatureToClient < ActiveRecord::Migration[5.1]
  def change
  	add_column :clients, :signature_url, :string
  end
end
