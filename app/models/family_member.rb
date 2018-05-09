class FamilyMember < ApplicationRecord
  has_many :family_members, inverse_of: :client
end
