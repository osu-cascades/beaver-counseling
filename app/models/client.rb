class Client < ApplicationRecord
  belongs_to :user, optional: true # belongs_to :counselor, :class_name: 'User'
  # accept: d'Arras Jr. S-Hausen
  validates :first_name, format: { with: /\A[a-zA-Z\'.-]+\z/ }
  validates :last_name, format: { with: /\A[a-zA-Z\'.-]+\z/ }
  #validate :validate_age
  validates :emergency_name, format: { with: /\A[a-zA-Z\'.-]+\z/ }
  validates :emergency_relation, format: { with: /\A[a-zA-Z]+\z/ }
  #validates :emergency_address, format: { }
  validates :emergency_phone, format: { with: /\d{3}-\d{3}-\d{4}/ }

=begin
  validates :health_insurance
  validates :counselor_seen_before
  validates :help_reason
=end

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

  def validate_age
    if dob.present? && dob > 120.years.ago.to_i
      errors.add(:dob, 'Older than 120, not likely')
    end
  end

end
