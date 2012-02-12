class Game < ActiveRecord::Base
  belongs_to :user


#  score must be in the range of 0-300
#  validates :score, :value => {:minimum => 0, :maximum => 300}

end
