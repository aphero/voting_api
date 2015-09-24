class Candidate < ActiveRecord::Base
  has_many :votes
  validates :name, uniqueness: true
  validates :party, uniqueness: true
end
