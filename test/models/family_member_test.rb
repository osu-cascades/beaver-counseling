require 'test_helper'

class FamilyMemberTest < ActiveSupport::TestCase
  test "has a name" do
    family_member = family_members(:valid)
    assert_respond_to(family_member, :name)
  end

end
