class Voter < ActiveRecord::Base

  has_one :vote

  def change
  end
end
