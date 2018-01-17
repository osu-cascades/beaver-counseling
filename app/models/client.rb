class Client < ApplicationRecord
  belongs_to :user, optional: true # belongs_to :counselor, :class_name: 'User'
  validates :first_name, format: { with: /\A[a-zA-Z]+\z/}
  after_initialize :assign_default_counselor

  def to_s
    "#{first_name} #{last_name}"
  end
end
