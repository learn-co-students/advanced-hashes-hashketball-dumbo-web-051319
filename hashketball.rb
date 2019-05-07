require 'pry'

def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
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
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
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

def num_points_scored(name)
  points = nil

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, player_data|
          points = player_data[:points] if player == name
        end
      end
    end
  end
  points
end

def shoe_size(name)
  size = nil

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, player_data|
          size = player_data[:shoe] if player == name
        end
      end
    end
  end
  size
end

def team_colors(team_name)
  team_colors = nil
  game_hash.each do |location, team_data|
    team_colors = team_data[:colors] if team_data[:team_name] == team_name
  end
  team_colors
end

def team_names
  team_names = []
  team_names << game_hash[:home][:team_name]
  team_names << game_hash[:away][:team_name]
end

def player_numbers(team_name)
  numbers =[]
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team_name
      team_data.each do |attribute, data|
        if attribute == :players
          numbers = data.map {|player, player_data| player_data[:number]}
        end
      end
    end
  end
  numbers
end

def player_stats(name)
  stats = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute, data|
      if attribute == name
        stats = data
      end
    end
  end
  stats
end

def big_shoe_rebounds
  biggest_shoe = 0
  big_shoe_rebounds = 0
  game_hash.each do |location, team_data|
    team_data[:players].each do |attribute, data|
      if shoe_size(attribute) > biggest_shoe
        biggest_shoe = shoe_size(attribute)
        big_shoe_rebounds = data[:rebounds]
      end
    end
  end
  big_shoe_rebounds
end
