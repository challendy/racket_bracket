class DropMatchesPlayersJoin < ActiveRecord::Migration
  def self.up
    drop_table :matches_players
    add_column :matches, :player_1, :integer
    add_column :matches, :player_2, :integer
  end

  def self.down
    create_table :matches_players, :id => false do |t|
      t.integer :match_id
      t.integer :player_id
      t.integer :player_position
    end
    remove_column :matches, :player_1
    remove_column :matches, :player_2 
  end
end
