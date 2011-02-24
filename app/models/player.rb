class Player < ActiveRecord::Base
  has_and_belongs_to_many :tournaments 
  # has_and_belongs_to_many :matches

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end

