class Voter < ActiveRecord::Base
  before_create :generate_access_token                        # Before a voter is created, generate an access token.

  has_one :vote
  validates :name, uniqueness: true, presence: true
  validates :party, presence: true

  private def generate_access_token
    begin                                                     # Looping!
      self.access_token = SecureRandom.hex                    # Generate a random hex token!
    end while self.class.exists?(access_token: access_token)  # Check to make sure that the generated token doesn't already exist.
  end
end

# THERE ARE THINGS IN DOUG'S
