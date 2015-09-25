class AddTokenToVoters < ActiveRecord::Migration
  def change
    add_column :voters, :token, :string           # Make a new column in Voters for tokens
  end

  Voter.all.each do |v|                           # Loop through all Voters
    v.update!(access_token: SecureRandom.hex)     # Generate new tokens for those empty fields
  end
end
