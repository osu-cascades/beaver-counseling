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

  def self.storage_bucket
    @storage_bucket ||= begin
      #config = Rails.application.config.x.settings
      config = YAML.load_file(Rails.root.join('config/settings.yml'))[Rails.env]
      storage = Google::Cloud::Storage.new project_id: config["project_id"],
                                     keyfile: Google::Auth::GCECredentials.new
      storage.bucket config["gcs_bucket"]
    end
  end

  def upload_image(sig)
    file = Client.storage_bucket.create_file \
     sig.tempfile,
     "sig/#{id}",
     content_type: sig.content_type,
     acl: "public"

    update_columns signature_url: file.public_url
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
