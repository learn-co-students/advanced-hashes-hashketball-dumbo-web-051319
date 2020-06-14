require 'pry'

def game_hash
  hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
     if data == team_data[:players]
        team_data[:players].each do |player_name,player_data|
          if player_name == player
        player_data.each do |player_key, player_value|
                 if player_key == :points
                  return player_value
                end
              end
          end
        end
      end
    end
  end
end
num_points_scored("Jason Terry")

def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
     if data == team_data[:players]
        team_data[:players].each do |player_name,player_data|
          if player_name == player
        player_data.each do |player_key, player_value|
                 if player_key == :shoe
                  return player_value
                end
              end
          end
        end
      end
    end
  end
end
shoe_size("Jason Terry")

def team_colors(team_name)
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
    if data == team_name
      return team_data[:colors]
      end
    end
  end
end

def team_names
teams = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
    if attribute == :team_name
       teams << team_data[:team_name]
      end
    end
  end
  return teams
end

def player_numbers(team_name)
  numbers = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        team_data[:players].each do |player_name,player_data|
          player_data.each do |player_key, player_value|
               if player_key == :number
                 numbers << player_data[:number]
                end
            end
          end
      return numbers
      end
    end
  end
end

def player_stats(player)
  arr = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
     if data == team_data[:players]
        team_data[:players].each do |player_name,player_data|
          if player_name == player
            player_data.each do |key, value|
              return player_data
            end
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
shoes = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
     if data == team_data[:players]
        team_data[:players].each do |player_name,player_data|
          player_data.each do |player_key, player_value|
            if player_key == :shoe
              shoes << player_value
                if shoes.max == player_value
                  player_data.each do |player_key, player_value|
                    if player_key == :rebounds
                      return player_value
                      end
                    end
                  end
                end
              end
            end
          end
      end
  end
end



