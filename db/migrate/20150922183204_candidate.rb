class Candidate < ActiveRecord::Base

  has_many :votes

  def change
  end
end
