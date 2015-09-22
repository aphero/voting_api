class Vote < ActiveRecord::Base
  
  belongs_to :voters

  def change
  end
end
