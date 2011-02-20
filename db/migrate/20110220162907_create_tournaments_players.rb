class CreateTournamentsPlayers < ActiveRecord::Migration
  def self.up
    create_table :tournaments_players, :id => false do |t|
      t.integer :tournament_id
      t.integer :players_id
    end
  end

  def self.down
    drop_table :tournaments_players
  end

end
