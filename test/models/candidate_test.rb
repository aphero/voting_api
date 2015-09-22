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
end
