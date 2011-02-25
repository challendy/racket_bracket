class AddScoresToMatches < ActiveRecord::Migration
  def self.up
    add_column :matches, :player_1_scores, :string
    add_column :matches, :player_2_scores, :string
    drop_table :tournaments_players
  end

  def self.down
    remove_column :matches, :player_1_scores
    remove_column :matches, :player_2_scores    
  end
end
