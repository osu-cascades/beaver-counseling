class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :clients
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: %w(admin counselor)
  def self.find_version_counselor(version)
    begin
      find(version.terminator)
    rescue
      @error_message="client has no counselor"
    end
  end
end
