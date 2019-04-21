# Write your code here!
require "pry"
def good_practices
  game_hash.each do |location, team_data|
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



def game_hash
  {
  :home => {
    :team_name  => "Brooklyn Nets",
    :colors     => ["Black", "White"],
    :players    => {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
    }
  },
  :away => {
    :team_name  => "Charlotte Hornets",
    :colors     => ["Turquoise", "Purple"],
    :players    => {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2,
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
     }
  }
}
end

def num_points_scored(player)
game_hash.each do |a, b|
b[:players].each do |player_name, data|
  if player_name == player
    return data[:points]
    end
  end
end
end

def shoe_size(player)
  game_hash.each do |a, b|
    b[:players].each do |player_name, data|
      if player_name == player
        return data[:shoe]
      end
    end
  end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:colors]
    end
  end
end

def team_names
  game_hash.collect do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(name)
  array = []
   game_hash.each do |location, team_data|
    if team_data[:team_name] == name
      team_data[:players].each { |player_name, value|
        array << value[:number] }
    end
  end
  array
end

def player_stats(name)
   game_hash.each do |location, team_data|
      team_data[:players].each do |player_name, value|
         if player_name == name
            return value
         end
      end
   end
end

def big_shoe_rebounds
   shoe_size = 0
   rebound = 0
   game_hash.each do |location, team_data|
      team_data[:players].each do |player_name, value|
         if value[:shoe] > shoe_size
            shoe_size = value[:shoe]
            rebound = value[:rebounds]
         end
      end
   end
   rebound
   def most_points_scored
  pName=nil
  pScore=0
  game_hash.each do |team, teamDetails|
    teamDetails[:players].each do |indvidStats|
      if indvidStats[:points] > pScore
        pScore= indvidStats[:points]
        pName= indvidStats[:name]
      end
    end
  end
  pName
end

def winning_team
  winner={}
  game_hash.values.each do |teamDetails|
    teamPoints=0
    teamDetails[:players]. each do |indvidStats|
      teamPoints += indvidStats[:points]
    end
    winner[teamDetails[:team_name]]= teamPoints
  end
  winner.key(winner.values.max)
end


def player_with_longest_name
  nameSize=0
  pName= nil
  game_hash.each do |team, teamDetails|
    teamDetails[:players].each do |indvidStats|
      if indvidStats[:name].length > nameSize
        nameSize = indvidStats[:name].length
        pName= indvidStats[:name]
      end
    end
  end
  pName
end

def long_name_steals_a_ton?
  pName=nil
  pSteals=0
  game_hash.each do |team, teamDetails|
    teamDetails[:players].each do |indvidStats|
      if indvidStats[:steals] > pSteals
        pSteals = indvidStats[:steals]
        pName= indvidStats[:name]
      end
    end
  end

  if pName == player_with_longest_name
    return true
  else
    return false
  end
end

def home_team_addpoints
  pName=nil
  game_hash.each do |home, teamDetails|
    teamDetails[:players].each do |indvidStats|
          game_hash[:home][:points]=indvidStats[:points]+4
      end
    end
  end
  puts home_team_addpoints
