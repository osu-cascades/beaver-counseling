class Client < ApplicationRecord
  belongs_to :user # belongs_to :counselor, :class_name: 'User'
  validates :first_name, format: { with: /\A[a-zA-Z]+\z/}
  after_initialize :assign_default_counselor

  private

    def assign_default_counselor
      # counselor = User.default_counselor
    end

end
