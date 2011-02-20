class AddSizeToTournament < ActiveRecord::Migration
  def self.up
    add_column :tournaments, :size, :integer
  end

  def self.down
    remove_column :tournaments, :size
  end
end
