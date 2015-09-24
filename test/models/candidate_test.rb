require 'test_helper'

class CandidateTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_name
    c = Candidate.create(name: "Badger")
    assert_equal c.name, "Badger"
  end

  def test_district
    c = Candidate.create(district: "Eleventy Two")
    assert_equal c.district, "Eleventy Two"
  end

  def test_candidate_associated_with_vote
    candy = Candidate.create!(name: "Optimus Prime", party: "Autobots")
    vote = Vote.new
    candy.votes << vote
    assert_equal Candidate.find(candy.id).votes, [vote]
  end

  def test_unique_candidate
    candy = Candidate.create!(name: "Count Chocula", party: "Breakfast")
    candies = Candidate.new(name: "Count Chocula", party: "Breakfast")
    refute candies.save
  end

  def test_name_party_presence
    assert Candidate.create().valid?
  end
end
