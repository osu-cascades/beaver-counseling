class Client < ApplicationRecord
  belongs_to :user, optional: true # belongs_to :counselor, :class_name: 'User'
  validates :first_name, format: { with: /\A[a-zA-Z]+\z/}
  after_initialize :assign_default_counselor

  def to_s
    "#{first_name} #{last_name}"
  end

  private

  def assign_default_counselor
      counselor_id = User.find_by_role(1).id
  end

end
