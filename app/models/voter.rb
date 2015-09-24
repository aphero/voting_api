class Voter < ActiveRecord::Base
  has_one :vote
  validates :name, uniqueness: true, presence: true
  validates :party, presence: true
end
