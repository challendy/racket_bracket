class Tournament < ActiveRecord::Base
  has_many :matches
  has_and_belongs_to_many :players

  accepts_nested_attributes_for :matches  

  after_create :process_matches

  def process_matches
    unless self.size.blank?
      #position could be assigned in match creation?
      position = 1
      (self.size - 1).times do 
        self.matches.create!(:position => position)
        position += 1
      end
    end
  end 
end
