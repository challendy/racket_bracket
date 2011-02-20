class CreateMatchesPlayers < ActiveRecord::Migration
  def self.up
    create_table :matches_players, :id => false do |t|
      t.integer :match_id
      t.integer :player_id
      t.integer :player_position
    end
  end

  def self.down
    drop_table :matches_players
  end

end
