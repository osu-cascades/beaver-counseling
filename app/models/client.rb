require "google/cloud/storage"

class Client < ApplicationRecord
  belongs_to :user, optional: true # belongs_to :counselor, :class_name: 'User'
  # accept: d'Arras Jr. S-Hausen
  validates :first_name, format: { with: /\A[a-zA-Z\'.-]+\z/ }
  validates :last_name, format: { with: /\A[a-zA-Z\'.-]+\z/ }
  validates :dob, :presence => true
  validates :emergency_name, format: { with: /\A[a-zA-Z\'.-]+\z/ }
  validates :emergency_relation, format: { with: /\A[a-zA-Z]+\z/ }
  validates :emergency_phone, format: { with: /\d{3}-\d{3}-\d{4}/ }
  validates :counselor_seen_before, inclusion: { in: [ true, false ] }
  validates :insurance_company, presence: true
  validate :validate_leave_message

  has_many :family_members
  has_many :notes
  accepts_nested_attributes_for :family_members, allow_destroy: true
  has_paper_trail

  def upload_image(sig)
    puts sig

    storage = Google::Cloud::Storage.new(
      project: "cascadesclinic-197917",
      keyfile: "#{Rails.root}/service-account.json"
    )
    bucket = storage.bucket "cascadesclinic-197917.appspot.com"
    #file = bucket.file "2.png"
    puts "in controller testing"
    bucket.create_file StringIO.new(sig), "zzz.txt"

    file = bucket.file "zzz.txt"

    puts file.public_url

    self.signature_url = file.public_url
  end


  def to_s
    "#{first_name} #{last_name}"
  end

  def counselor_name
    user ? user.name : ''
  end

  def validate_leave_message
    # this is not a possible state
    if :phone_number.present? && :leave_message.present? == false
      errors.add(:phone_number, 'phone number is required')
    end
  end

end
