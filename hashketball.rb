# Write your code here!
require 'pry'
def game_hash
  top_level = {
    :home => {
      :team_name => 'Brooklyn Nets',
      :colors => ['Black', 'White'],
      :players => [
        {:name => 'Alan Anderson', :number => 0, :shoe=> 16 ,:points=> 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
        {:name => 'Reggie Evans', :number => 30, :shoe=> 14, :points=> 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
        {:name => 'Brook Lopez', :number => 11, :shoe=> 17, :points=> 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
        {:name => 'Mason Plumlee', :number => 1, :shoe=> 19, :points=> 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
        {:name => 'Jason Terry', :number => 31, :shoe=> 15, :points=> 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}
      ]
    },

    :away => {
      :team_name => 'Charlotte Hornets',
      :colors => ['Turquoise', 'Purple'],
      :players => [
        {:name => 'Jeff Adrien', :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
        {:name => 'Bismack Biyombo', :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
        {:name => 'DeSagna Diop', :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
        {:name => 'Ben Gordon', :number => 8, :shoe => 15 ,:points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
        {:name => 'Brendan Haywood', :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}
      ]
    }
  }
end


def num_points_scored(player_name)
  #find both team
  #players = game_hash[:home][:players].concat(game_hash[:away][:players])
  #go through each of their player_stats
  #players.each do |player|
    #find that player's we wanted
#    if player_name == player[:name]
      #find that players points
  #    players[:points]
  #end end end
  #same as the next method, which finds shoe -- the syntax can be combined

  game_hash.values.each do |team|
      team[:players].each do |player|
          return player[:points] if player.has_value?(player_name)
        end
    end
end

def shoe_size(player_name)
  game_hash.values.each do |team_info|
      team_info[:players].each do |player|
          return player[:shoe] if player.has_value?(player_name)
        end
    end
end

def team_colors(team_name)
  game_hash.values.each do |team_info|
    if team_info.has_value?(team_name)
      return team_info[:colors].map(&:capitalize)
    end
  end
end

def team_names
  game_hash.values.map {|value| value[:team_name]}

end

def player_numbers(team_name)
  game_hash.values.each do |team_info|
    if team_info.has_value?(team_name)
      return team_info[:players].map do |player| player[:number]

      end
    end
  end
end

def player_stats(player_name)
  game_hash.each do |location, team_stats|

    team_stats[:players].each do |player_s|
        # binding.pry
      if player_name == player_s[:name]

        player_s.delete(:name)
        #binding.pry
        return player_s
      end
    end
  end
end


def big_shoe_rebounds
  big_shoe = 0
  player_rebounds = 0
  game_hash.values.each do |team_info|
    team_info[:players].each do |player|
      if player[:shoe] > big_shoe
        big_shoe = player[:shoe]
        player_rebounds = player[:rebounds]
      end
    end
  end
return player_rebounds
end
#binding pry
