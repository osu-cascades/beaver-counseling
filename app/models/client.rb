require "google/cloud/storage"

class Client < ApplicationRecord
  belongs_to :user, optional: true # belongs_to :counselor, :class_name: 'User'
  # accept: d'Arras Jr. S-Hausen
  validates :first_name, format: { with: /\A[a-zA-Z\'.-]+\z/ }
  validates :last_name, format: { with: /\A[a-zA-Z\'.-]+\z/ }
  validates :dob, :presence => true
  validates :phone_number, format: { with: /\d{3}-\d{3}-\d{4}/ }
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
    storage = Google::Cloud::Storage.new(
      project: "cascadesclinic-197917",
      keyfile: "#{Rails.root}/service-account.json"
    )
    bucket = storage.bucket "cascadesclinic-197917.appspot.com"
    puts "in controller testing"
    bucket.create_file StringIO.new(sig), "#{self.first_name}_#{self.last_name}.txt"

    file = bucket.file "#{self.first_name}_#{self.last_name}.txt"

    puts "\n\n\n"
    puts file.public_url

    self.signature_url = file.public_url
  end

  def get_image()
    storage = Google::Cloud::Storage.new(
      project: "cascadesclinic-197917",
      keyfile: "#{Rails.root}/service-account.json"
    )
    bucket = storage.bucket "cascadesclinic-197917.appspot.com"
    file = bucket.file "_#{self.first_name}.txt"

    download = file.download
    download.rewind
    return download.read
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
