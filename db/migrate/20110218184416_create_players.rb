class CreatePlayers < ActiveRecord::Migration
  def self.up
    create_table :players do |t|
      t.integer  :atp_rank
      t.string   :first_name
      t.string   :last_name
      t.integer  :points
      t.integer  :position_moved
      t.integer  :tournaments_played
      t.string   :country
      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end

