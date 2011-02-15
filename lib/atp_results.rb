require 'rubygems'
require 'open-uri'


class AtpResults

  def initialize
    # create_logs
  end

  def run
    import
    # print_log_footer
  end
  
  def import
    #Make dynamic for past dates ?date=20110209
    doc = Nokogiri::HTML(open("http://sports.espn.go.com/sports/tennis/dailyResults"))


    daily_results = []
    doc.css('.scoreHeadline').each do |tournament|
      puts "Tournament#{tournament.content.to_s.strip}"
      current_tourney = {}
      current_tourney["name"] = tournament.content.to_s.strip
      round = tournament.next_element()
      col_left = round.next_element()
      
      matches = []
      col_left.children.each do |child|
        match_id = child["id"]
        unless match_id.blank?
          match = {}
          match["id"] = match_id.to_s

          player_info_rows = doc.css("##{match_id} > .teams tr")
          match["status"] = player_info_rows[0].content
          match["player_1"] = player_info_rows[1].content
          match["player_2"] = player_info_rows[2].content
          
          match_info_rows = doc.css("##{match_id} > .linescore tr")
          match["sets"] = match_info_rows[0].content
          match["player_1_score"] = match_info_rows[1].content
          match["player_2_score"] = match_info_rows[2].content
        end
        matches << match
      end

      col_right = col_left.next_element()

      col_right.children.each do |child|
        match_id = child["id"]
        unless match_id.blank?
          match = {}
          match["id"] = match_id

          player_info_rows = doc.css("##{match_id} > .teams tr")
          match["status"] = player_info_rows[0].content
          match["player_1"] = player_info_rows[1].content
          match["player_2"] = player_info_rows[2].content
          
          match_info_rows = doc.css("##{match_id} > .linescore tr")
          match["sets"] = match_info_rows[0].content
          match["player_1_score"] = match_info_rows[1].content
          match["player_2_score"] = match_info_rows[2].content          
        end
        matches << match
      end
      current_tourney["matches"] = matches
      daily_results << current_tourney
    end
    daily_results
  end
  
  def create_logs
    @log_file = File.new("#{IMPORT_LOG_PATH}/#{Time.now.strftime("%Y_%m_%d")}.log", "w+")
    print_header    
  end
  
  def print_header
    @log_file << "\nStarted Import at: #{Time.now.strftime("%I:%M%p on %a %b %e, %Y")}\n----------------------------------------------------------------\n"
  end
  
  def print_log_footer
    @log_file << "\n----------------------------------------------------------------\nFinished Import at: #{Time.now.strftime("%I:%M%p on %a %b %e, %Y")}\n"
    @log_file.close
  end
end

