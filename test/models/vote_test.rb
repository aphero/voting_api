require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def test_voter_id
    v = Vote.create(voter_id: 1)
    assert_equal v.voter_id, 1
  end

  def test_candidate_id
    v = Vote.create(candidate_id: 1)
    assert_equal v.candidate_id, 1
  end
end
