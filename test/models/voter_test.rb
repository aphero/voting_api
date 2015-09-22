require 'test_helper'

class VoterTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_name
    v = Voter.create(name: "Bob")
    assert_equal "Bob", v.name
  end

  def test_party
    v = Voter.create(party: "Decepticon")
    assert_equal "Decepticon", v.party
  end
end
