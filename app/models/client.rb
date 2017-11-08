class Client < ApplicationRecord

  validates :first_name, format: { with: /\A[a-zA-Z]+\z/}

end
