require 'open-uri'

class ImportPlayerRankings

  def initialize(attr)
    @doc = Nokogiri::HTML(open("http://www.atpworldtour.com/Rankings/Singles.aspx?r=#{attr}#"))
    process
  end

  def process
    players = []
    @doc.css('.bioTableAlt tr').each do |table|
      players << table.children.text
    end

    players[1..(players.length-1)].each do |player|
      a = player.lines.to_a
      
      rank =  a[0].gsub(" ", "")
      
      name = a[2].gsub(" ", "").delete!("^\u{0000}-\u{007F}")
      j_name = name.gsub(/\S{4}[)]/,"")
      name_array = j_name.strip.split(",")

      country = name[/\S{4}[)]/]
      country.gsub!("(", "").gsub!(")", "")
      
      points =  a[4].gsub(" ", "")
      j_points = points.gsub(",", "")
      position_moved = a[5].gsub(" ", "")
      tournaments_played = a[6].gsub(" ", "")


      existing_player = Player.find_by_last_name(name_array[1])
      unless existing_player.blank?
        existing_player.update_attributes(:atp_rank => rank, 
                                          :points => j_points,
                                          :position_moved => position_moved, 
                                          :tournaments_played => tournaments_played)
        #TODO Create import log and logs basics
        puts "Updating: #{existing_player.last_name}"
      else
        p = Player.create(:atp_rank => rank, 
                      :first_name => name_array[1], 
                      :last_name => name_array[0],                     
                      :points => j_points,
                      :position_moved => position_moved, 
                      :tournaments_played => tournaments_played, 
                      :country => country)
        #TODO Create import log and logs basics
        puts "Creating: #{p.last_name}"

      end
    end 
  end
end
