class Match < ActiveRecord::Base
  belongs_to :tournament
  # has_and_belongs_to_many :players
  
  belongs_to :player_1, :class_name => "Player", :foreign_key => "player_1"
  belongs_to :player_2, :class_name => "Player", :foreign_key => "player_2"
  
  
end
