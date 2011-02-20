class CreateTournaments < ActiveRecord::Migration
  def self.up
    create_table :tournaments do |t|
      t.string :name
      t.string :location
      t.string :level
      t.date :start_date
      t.date :end_date      
    
      t.timestamps
    end
  end

  def self.down
    drop_table :tournaments
  end
end
