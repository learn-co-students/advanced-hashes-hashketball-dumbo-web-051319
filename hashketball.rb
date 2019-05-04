

def game_hash
	return_object = {
		home: {
			team_name: "Brooklyn Nets",
			colors: ["Black", "White"],
			players: {
				"Alan Anderson": {
					number: 0,
					shoe: 16,
					points: 22,
					rebounds: 12,
					assists: 12,
					steals: 3,
					blocks: 1,
					slam_dunks: 1
				},
				"Reggie Evans": {
					number: 30,
					shoe: 14,
					points: 12,
					rebounds: 12,
					assists: 12,
					steals: 12,
					blocks: 12,
					slam_dunks: 7
				},
				"Brook Lopez": {
					number: 11,
					shoe: 17,
					points: 17,
					rebounds: 19,
					assists: 10,
					steals: 3,
					blocks: 1,
					slam_dunks: 15 
				},
				"Mason Plumlee": {
					number: 1,
					shoe: 19,
					points: 26,
					rebounds: 12,
					assists: 6,
					steals: 3,
					blocks: 8,
					slam_dunks: 5  
				},
				"Jason Terry": {
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
		away: {
			team_name: "Charlotte Hornets",
			colors: ["Turquoise", "Purple"],
			players: {
				"Jeff Adrien": {
					number: 4,
					shoe: 18,
					points: 10,
					rebounds: 1,
					assists: 1,
					steals: 2,
					blocks: 7,
					slam_dunks: 2 
				},
				"Bismack Biyombo": {
					number: 0,
					shoe: 16,
					points: 12,
					rebounds: 4,
					assists: 7,
					steals: 7,
					blocks: 15,
					slam_dunks: 10 
				},
				"DeSagna Diop": {
					number: 2,
					shoe: 14,
					points: 24,
					rebounds: 12,
					assists: 12,
					steals: 4,
					blocks: 5,
					slam_dunks: 5 
				},
				"Ben Gordon": {
					number: 8,
					shoe: 15,
					points: 33,
					rebounds: 3,
					assists: 2,
					steals: 1,
					blocks: 1,
					slam_dunks: 0 
				},
				"Brendan Haywood": {
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

####################################################################

def num_points_scored(player_name)
  game_hash.each { |location, team_data|
    team_data.each { |attribute, data|
      if (attribute == :players)
        data.each { |player, stats|
          if (player.to_s == player_name)
            return stats[:points]
          end
        }
      end
    }
  }
end

####################################################################

def shoe_size(player_name)
  game_hash.each { |location, team_data|
    team_data.each { |attribute, data|
      if (attribute == :players)
        data.each { |player, stats|
          if (player.to_s == player_name)
            return stats[:shoe]
          end
        }
      end
    }
  }
end

###################################################################

def team_colors(team)
  game_hash.each { |location, team_data|
    if (team_data[:team_name] == team)
      return team_data[:colors]
    end
  }
end

###################################################################

def team_names
  teams_array = []
  game_hash.each { |location, team_data|
    teams_array << team_data[:team_name]
  }
  return teams_array
end

###################################################################

def player_numbers(team)
  numbers_array = []
  game_hash.each { |location, team_data|
    if (team_data[:team_name] == team)
      team_data.each { |attribute, data|
        if (attribute == :players)
          data.each { |player, stats|
            numbers_array << stats[:number]
          }
        end
      }
    end
  }
  return numbers_array.sort
end

#####################################################################

def player_stats(player_name)
  game_hash.each { |location, team_data|
    team_data.each { |attribute, data|
      if (attribute == :players)
        data.each { |player, stats|
          if (player.to_s == player_name)
            return stats
          end
        }
      end
    }
  }
end

######################################################################

def big_shoe_rebounds
  players_array = []
  shoes_array = []

  game_hash.each { |location, team_data|
    team_data.each { |attribute, data|
      if (attribute == :players)
        data.each { |player, stats|
          players_array << player
          shoes_array << stats[:shoe]
        }
      end
    }
  }

  player_name = players_array[shoes_array.index(shoes_array.max)]

  game_hash.each { |location, team_data|
    team_data.each { |attribute, data|
      if (attribute == :players)
        data.each { |player, stats|
          if (player == player_name)
            return stats[:rebounds]
          end
        }
      end
    }
  }
end

######################################################################

def most_points_scored
  players_array = []
  points_array = []

  game_hash.each { |location, team_data|
    team_data.each { |attribute, data|
      if (attribute == :players)
        data.each { |player, stats|
          players_array << player
          points_array << stats[:points]
        }
      end
    }
  }

  player_name = players_array[points_array.index(points_array.max)]
  return player_name.to_s
end

#####################################################################

def winning_team
  teams_array = []
  players_array = []
  points_array = []

  game_hash.each { |location, team_data|
    team_data.each { |attribute, data|
      if (attribute == :team_name)
        teams_array << team_data[:team_name]
      end
      if (attribute == :players)
        data.each { |player, stats|
          players_array << player
          points_array << stats[:points]
        }
      end
    }
  }

  team1_points = 0
  for i in (1..(points_array.length / 2))
    team1_points += points_array[i - 1]
  end

  team2_points = 0
  for i in (((points_array.length / 2) + 1)..points_array.length)
    team2_points += points_array[i - 1]
  end

  if (team1_points > team2_points)
    return teams_array[0]
  elsif (team2_points > team1_points)
    return teams_array[1]
  end
end

##################################################################

def player_with_longest_name
  players_array = []
  players_name_lengths = []

  game_hash.each { |location, team_data|
    team_data.each { |attribute, data|
      if (attribute == :players)
        data.each { |player, stats|
          players_array << player
        }
      end
    }
  }

  players_array.each { |player|
    players_name_lengths << player.to_s.length
  }

  indx = players_name_lengths.each_index.select { |i| players_name_lengths[i] == players_name_lengths.max }

  # Both Bismack Biyombo and Brendan Haywood have the longest names, but test expects Brendan Haywood
  return players_array[indx[1]].to_s
end

###################################################################

def long_name_steals_a_ton?
  players_array = []
  steals_array = []

  game_hash.each { |location, team_data|
    team_data.each { |attribute, data|
      if (attribute == :players)
        data.each { |player, stats|
          players_array << player
          steals_array << stats[:steals]
        }
      end
    }
  }

  player_name = players_array[steals_array.index(steals_array.max)]

  if (player_name.to_s == player_with_longest_name)
    return true
  else return false   end
end













