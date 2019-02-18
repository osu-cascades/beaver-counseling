class FamilyMember < ApplicationRecord
  belongs_to :client

  validates :name, format: { with: /\A[a-zA-Z\'.-]+\z/ }, allow_blank: true
  validates :relation, format: { with: /\A[a-zA-Z\'.-]+\z/ }, allow_blank: true
  validates :age, numericality: { only_integer: true }, allow_blank: true
end
