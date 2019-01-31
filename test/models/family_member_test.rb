require 'test_helper'

class FamilyMemberTest < ActiveSupport::TestCase
  test "resonds to name" do
    family_member = family_members(:valid)
    assert_respond_to(family_member, :name)
  end

  test "resonds to relation" do
    family_member = family_members(:valid)
    assert_respond_to(family_member, :relation)
  end

   test "an age value that is a string is invalid" do
    @family_member.age = ralph
    refute @family_member.valid?
  end
end
