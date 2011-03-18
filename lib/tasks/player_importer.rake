namespace :atp do
  desc "Initial db load of atp players"
  task :player_importer  => :environment do
    ["", "101", "201"].each do |range| 
      ImportPlayerRankings.new(range)
    end    
  end
end

namespace :atp do
  desc "Initial db load of atp players"
  task :results  => :environment do
    AtpResults.new
  end    
end
