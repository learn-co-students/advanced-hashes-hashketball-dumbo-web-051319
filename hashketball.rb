# Write your code here!
require "pry"

def game_hash
  hash = {
    :home => {
      :team_name => ["Brooklyn Nets"], 
      :colors => ["Black", "White"], 
      :players => {
        "Alan Anderson" => {
          :number => 0, :shoe => 16, :points => 22, 
          :rebounds => 12, :assists => 12, :steals => 3,
          :blocks => 1, :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30, :shoe => 14, :points => 12, 
          :rebounds => 12, :assists => 12, :steals => 12,
          :blocks => 12, :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11, :shoe => 17, :points => 17, 
          :rebounds => 19, :assists => 10, :steals => 3,
          :blocks => 1, :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1, :shoe => 19, :points => 26, 
          :rebounds => 12, :assists => 6, :steals => 3,
          :blocks => 8, :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31, :shoe => 15, :points => 19, 
          :rebounds => 2, :assists => 2, :steals => 4,
          :blocks => 11, :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => ["Charlotte Hornets"], 
      :colors => ["Turquoise", "Purple"], 
      :players => {
        "Jeff Adrien" => {
          :number => 4, :shoe => 18, :points => 10, 
          :rebounds => 1, :assists => 1, :steals => 2,
          :blocks => 7, :slam_dunks => 2
        },
        "Bismack Biyombo" => {
          :number => 0, :shoe => 16, :points => 12, 
          :rebounds => 4, :assists => 7, :steals => 7,
          :blocks => 15, :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2, :shoe => 14, :points => 24, 
          :rebounds => 12, :assists => 12, :steals => 4,
          :blocks => 5, :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8, :shoe => 15, :points => 33, 
          :rebounds => 3, :assists => 2, :steals => 1,
          :blocks => 1, :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33, :shoe => 15, :points => 6, 
          :rebounds => 12, :assists => 12, :steals => 22,
          :blocks => 5, :slam_dunks => 12
        }
      }
    }
  }
end



def good_practices
  game_hash.each do|location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry
 
        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end

#good_practices

def num_points_scored(player_name)
  hash = game_hash
  point_out = 0
  
  hash.each do |team, team_data|
    team_data.each do |find_players, stat_data|
      if find_players.to_s == "players"
        stat_data.each do |players, find_points|
          if players == player_name
            find_points.each do |player_data, points|
              if player_data.to_s == "points"
                point_out = points
              end
            end
          end
        end
      end
    end
  end
  point_out
end

def shoe_size (player_name)
  hash = game_hash
  shoe_out = 0
  
  hash.each do |team, team_data|
    team_data.each do |find_players, stat_data|
      if find_players.to_s == "players"
        stat_data.each do |players, find_shoe|
          if players == player_name
            find_shoe.each do |player_data, shoe|
              if player_data.to_s == "shoe"
                shoe_out = shoe
              end
            end
          end
        end
      end
    end
  end
  shoe_out
end

def team_colors(team_name)
  hash = game_hash
  colors_out = []
  switch = false

        #home, team_name / colors / players / stats
  hash.each do |team, team_data|  
        #team_name/ colors / players, Charlotte / Purple / Jeff
    team_data.each do |find_team_name, team_data|
      if find_team_name.to_s == "team_name" 
        if team_data[0] == team_name 
          switch = true
        end
      end
      if find_team_name.to_s == "colors" && switch == true
        colors_out = team_data
        switch = false
      end
    end
  end
  colors_out
end

def team_names()
  hash = game_hash
  teamArray = []
  
  hash.each do |team, find_name|
    find_name.each do |team_name, name_data|
      if team_name.to_s == "team_name"
        teamArray << name_data.join
      end
    end
  end
  teamArray
end

def player_numbers(team_name)
  jersey_number_array = []
  hash = game_hash
  switch = false
  
  hash.each do |team, team_data|
    team_data.each do |find_players, team_data|
      if find_players.to_s == "team_name" 
        if team_data[0] == team_name 
          switch = true
        end
      end
      if find_players.to_s == "players" && switch == true
        team_data.each do |players, find_jersey|
          find_jersey.each do |player_data, jersey|
            if player_data.to_s == "number"
              jersey_number_array << jersey
            end
          end
        end
      end
    end
    switch = false
  end
  jersey_number_array
end

def player_stats(player_name)
  hash = game_hash
  statHash = {}
  
  hash.each do |team, team_data|
    team_data.each do |find_players, stat_data|
      if find_players.to_s == "players"
        stat_data.each do |players, find_stats|
          if players == player_name
            find_stats.each do |player_data, stats|
              statHash[player_data] = stats
            end
          end
        end
      end
    end
  end
  statHash
end

def big_shoe_rebounds
  hash = game_hash
  playerNames = []
  shoeSizes = []
  rebounds = []

  hash.each do |team, team_data|
    team_data.each do |find_players, stat_data|
      if find_players.to_s == "players"
        stat_data.each do |players, find_shoe|
          find_shoe.each do |player_data, shoe|
            if player_data.to_s == "shoe"
              shoeSizes << shoe
            end
            if player_data.to_s == "rebounds"
              rebounds << shoe
            end
          end
        end
      end
    end
  end
  max = shoeSizes.max
  index = shoeSizes.index(max)
  rebounds[index]
end
