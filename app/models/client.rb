class Client < ApplicationRecord
  belongs_to :user
  validates :first_name, format: { with: /\A[a-zA-Z]+\z/}

end
