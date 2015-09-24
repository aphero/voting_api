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

  def test_voters_associated_with_one_vote
    voter = Voter.create!(name: "Optimus Prime", party: "Autobots")  # Create a new voter.  ! causes a failure if the Voter cannot be created.
    vote = Vote.new()                             # Start a new vote
    voter.vote = vote                             # Assign the vote to the voter
    assert_equal vote, Voter.find(voter.id).vote  # Check to ensure that the vote was assigned by finding the voter_id inside the Voter table for the Vote value.
  end

  def test_unique_voters
    voter = Voter.create!(name: "Count Chocula", party: "Breakfast")
    voter2 = Voter.new(name: "Count Chocula", party: "Breakfast")
    refute voter2.save
  end

  def test_name_party_presence
    v = Voter.new()
    refute v.valid?
  end
end
