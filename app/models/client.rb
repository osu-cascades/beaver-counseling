class Client < ApplicationRecord
  belongs_to :user, optional: true # belongs_to :counselor, :class_name: 'User'
  validates :first_name, format: { with: /\A[a-zA-Z]+\z/}

  has_many :family_members
  accepts_nested_attributes_for :family_members, allow_destroy: true

  def to_s
    "#{first_name} #{last_name}"
  end
end
