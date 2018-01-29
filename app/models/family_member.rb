class FamilyMember < ApplicationRecord
  has_many :family_members, inverse_of: :client
  accepts_nested_attributes_for :family_members
end
