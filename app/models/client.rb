class Client < ApplicationRecord
  belongs_to :user, optional: true # belongs_to :counselor, :class_name: 'User'
  validates :first_name, format: { with: /\A[a-zA-Z\']+\z/}

  has_many :family_members
  has_many :notes
  accepts_nested_attributes_for :family_members, allow_destroy: true
  has_paper_trail

  def to_s
    "#{first_name} #{last_name}"
  end

  def counselor_name
    user ? user.name : ''
  end

end
