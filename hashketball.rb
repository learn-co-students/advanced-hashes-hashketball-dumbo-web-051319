# Write your code here!
require 'pry'

def game_hash
  { home: {
    team_name: "Brooklyn Nets",
    colors: ["Black", "White"],
    players: {
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
  away: { team_name: "Charlotte Hornets",
    colors: ["Turquoise", "Purple"],
    players: {
      "Jeff Adrien" => {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
          },
          "Bismack Biyombo" => {
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


def all_players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end


def num_points_scored(name)
  player_name = all_players.fetch(name)
   return player_name[:points]
 end

def shoe_size(name)
  player_name = all_players.fetch(name)
  return player_name[:shoe]
end

def team_colors(team)
  if game_hash[:home][:team_name] == team
    return game_hash[:home][:colors]
  elsif game_hash[:away][:team_name] == team
    return game_hash[:away][:colors]
  end
end

def team_names
  team_array = []
  team_array.push(game_hash[:home][:team_name])
  team_array.push(game_hash[:away][:team_name])
  return team_array
end

def player_numbers(team)
  number_array = []
  if game_hash[:home][:team_name] == team
    player_hash = game_hash[:home][:players]
    player_hash.each do |player, stats|
      stats.each do |type, num|
        if type == :number
      number_array.push(player_hash[player][:number])
      end
    end
  end
  elsif game_hash[:away][:team_name] == team
    player_hash = game_hash[:away][:players]
    player_hash.each do |player, stats|
      stats.each do |type, num|
        if type == :number
      number_array.push(player_hash[player][:number])
      end
    end
  end
end
  return number_array
end

def player_stats(name)
  player_name = all_players.fetch(name)
end

def big_shoe_rebounds
  shoe_size = 0
  player_name = ""
  rebounds = 0
  all_players.each do |name, details|
      if all_players[name][:shoe] > shoe_size
        shoe_size = all_players[name][:shoe]
        player_name = name
        rebounds = all_players[name][:rebounds]
      end
  end
  return rebounds
end

# h = { "a" => 100, "b" => 200 }
# h.fetch("a")                            #=> 100
# h.fetch("z", "go fish")                 #=> "go fish"
# h.fetch("z") { |el| "go fish, #{el}"}   #=> "go fish, z"
