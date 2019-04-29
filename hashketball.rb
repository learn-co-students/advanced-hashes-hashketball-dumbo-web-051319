require 'pry'

def game_hash
    {
        :home => {
            :team_name => "Brooklyn Nets",
            :colors => ["Black", "White"],
            :players => [   
                {:player_name => "Alan Anderson", 
                    :number => 0,
                    :shoe => 16,
                    :points => 22,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 1},
                {:player_name => "Reggie Evans", 
                    :number => 30,
                    :shoe => 14,
                    :points => 12,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 12,
                    :blocks => 12,
                    :slam_dunks => 7},
                {:player_name => "Brook Lopez", 
                    :number => 11,
                    :shoe => 17,
                    :points => 17,
                    :rebounds => 19,
                    :assists => 10,
                    :steals => 3,
                    :blocks => 1,
                    :slam_dunks => 15},
                {:player_name => "Mason Plumlee", 
                    :number => 1,
                    :shoe => 19,
                    :points => 26,
                    :rebounds => 12,
                    :assists => 6,
                    :steals => 3,
                    :blocks => 8,
                    :slam_dunks => 5},
                {:player_name => "Jason Terry", 
                    :number => 31,
                    :shoe => 15,
                    :points => 19,
                    :rebounds => 2,
                    :assists => 2,
                    :steals => 4,
                    :blocks => 11,
                    :slam_dunks => 1}
            ]
        },
        
        
        :away => {
            :team_name => "Charlotte Hornets",
            :colors => ["Turquoise", "Purple"],
            :players => [
                {:player_name => "Jeff Adrien",
                    :number => 4,
                    :shoe => 18,
                    :points => 10,
                    :rebounds => 1,
                    :assists => 1,
                    :steals => 2,
                    :blocks => 7,
                    :slam_dunks => 2},
                {:player_name => "Bismak Biyombo", 
                    :number => 0,
                    :shoe => 16,
                    :points => 12,
                    :rebounds => 4,
                    :assists => 7,
                    :steals => 7,
                    :blocks => 15,
                    :slam_dunks => 10},
                {:player_name => "DeSagna Diop", 
                    :number => 2,
                    :shoe => 14,
                    :points => 24,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 4,
                    :blocks => 5,
                    :slam_dunks => 5},
                {:player_name => "Ben Gordon", 
                    :number => 8,
                    :shoe => 15,
                    :points => 33,
                    :rebounds => 3,
                    :assists => 2,
                    :steals => 1,
                    :blocks => 1,
                    :slam_dunks => 0},
                {:player_name => "Brendan Haywood",
                    :number => 33,
                    :shoe => 15,
                    :points => 6,
                    :rebounds => 12,
                    :assists => 12,
                    :steals => 22,
                    :blocks => 5,
                    :slam_dunks => 12}
            ]
        }
    }
end





def num_points_scored(player_n)
    game_hash.each do |home_away, keys|
      keys[:players].each do |player|
        
        if player_n == player[:player_name]
            return player[:points]  
        end
        # return player[:points] if player[:player_name] == player_n
      end
    end
  end


def shoe_size(player_n)
    game_hash.each do |home_away, keys|
        keys[:players].each do |player|
            if player_n == player[:player_name]
                return player[:shoe]
            end
        end
    end
end

def team_colors(team)
    game_hash.each do |home_away, keys|
       if team == keys[:team_name]
        
            return keys[:colors]
       end
    end
end

def team_names
    new_array = []
    game_hash.each do |home_away, keys|
        new_array << keys[:team_name]
         
    end
    
    return new_array
end

def player_numbers(team)
    new_array = []
    game_hash.each do |home_away, keys|
        keys[:players].each do |player|
            if team == keys[:team_name]
                new_array << player[:number]
            end 
        end
    end
    new_array
end

def player_stats(pla_name)
    new_array = []
    game_hash.each do |home_away, keys|
        keys[:players].each do |player|
            if pla_name == player[:player_name]
                return player.delete_if { |stat, value| [:player_name].include?(stat)}
            end
        end
        
    end
end

def big_shoe_rebounds
    biggest = 0
    rebounds = 0 
    game_hash.each do |home_away, keys|
        keys[:players].each do |player|
            size = player[:shoe] 
            if size > biggest
                biggest = size
                rebounds = player[:rebounds]
            end
            
        end
    end
    rebounds
end

def most_points_scored
    highiest = 0
    playa = ""
    game_hash.each do |home_away, keys|
      keys[:players].each do |player|
        points = player[:points]
        
        if points > highiest
            highiest = points
            playa = player[:player_name]
        end
      end
    end
    playa
end

# def winning_team
#     total_pts = 0
#     game_hash.each do |home_away, keys|
        
#         keys[:players].each do |pleyer|

#         end
#     end
# end

def player_with_longest_name
    character_length = 0
    longgest_name = ""
    game_hash.each do |home_away, keys|
        keys[:players].each do |player|
           name_of_player = player[:player_name]
           character_count = name_of_player.length
           if character_count > character_length
                longgest_name = name_of_player  
           end
        end
    end
    longgest_name
end



# def winning_team
#     total_points = 0
#     win_team = ''
#     game_hash.each do |home_away, keys|
#       team_points = 0
#       team_name = game_hash[home_away][:team_name]
#       keys[:players].each do |player|
#         points = player[:points]
#         team_points += points
#       end
#       win_team, total_points = team_name, team_points if team_points > total_points
#     end
#     return win_team
#   end
  
#    def player_with_longest_name
#     longest = ''
#     longest_length = 0
#     game_hash.each do |home_away, keys|
#       keys[:players].each do |player|
#         name_length = player[:player_name].length
#         longest, longest_length = player[:player_name], name_length if name_length > longest_length
#       end
#     end
#     return longest
#   end
  
  
#    # Super Bonus
  
#    def long_name_steals_a_ton?
#     steals_most = ''
#     most_steals = 0
#     game_hash.each do |home_away, keys|
#       keys[:players].each do |player|
#         steals_most, most_steals = player[:player_name], player[:steals] if player[:steals] > most_steals
#       end
#     end
#     return true if steals_most == player_with_longest_name
#   end