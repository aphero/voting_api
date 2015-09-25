class VotersController < ApplicationController
  def index
     render json: Voter.all.to_json
  end

  def show
    id = params[:id]
    render json: Voter.find(id).to_json
  end

  def create
    voter = Voter.new(name: params[:name], party: params[:party])   # Create a new voter by his/her name and party.
    if voter.save                                                   # If voter can be saved
      # voter.access_token = SecureRandom.hex                         # Generate a new hex token          #Deactivated because it's better to put in the model
      # voter.save                                                    # Save the newly generated token
      render json: voter.to_json                                    # Show the newly created voter
    else                                                            # Otherwise
      render json: voter.errors                                     # Display some sort of error things
    end
  end

  def update
    voter = Voter.find(params["id"])
    if voter.access_token == params["access_token"]
      voter.name = params[:name] if params[:name]
      voter.party = params[:party] if params[:party]
      if voter.save
        render json: voter
      else
        render json: voter.errors
      end
    else
      render json: "Oops I crapped my pants"
    end
  end
end
