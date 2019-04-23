require 'pry'

def game_hash
	game = {
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

def num_points_scored(player_name)
	points = nil
	game_hash.each do |location, team_data|
		team_data[:players].each do |player, stats|
			if player == player_name
				points = stats[:points]
			end
		end
	end

	points
end

def shoe_size(player_name)
	shoe = nil
	game_hash.each do |location, team_data|
		team_data[:players].each do |player, stats|
			if player == player_name
				shoe = stats[:shoe]
			end
		end
	end

	shoe
end

def team_colors(team)
	colors = nil
	game_hash.each do |location, team_data|
		if team_data[:team_name] == team
			colors = team_data[:colors]
		end
	end

	colors
end

def team_names
	teams = []
	game_hash.each do |location, team_data|
		teams << team_data[:team_name]
	end

	teams
end

def player_numbers(team)
	numbers = []
	game_hash.each do |location, team_data|
		if team_data[:team_name] == team
			team_data[:players].each do |player, stats|
				numbers << stats[:number]
			end
		end
	end

	numbers
end

def player_stats(player_name)
	player_stats = {}
	game_hash.each do |location, team_data|
		team_data[:players].each do |player, stats|
			if player_name == player
				player_stats = stats
			end
		end
	end

	player_stats
end

def big_shoe_rebounds
	max_shoe_size_value = 0
	max_shoe_size_rebounds = nil
	game_hash.each do |location, team_data|
		team_data[:players].each do |player, stats|
			if stats[:shoe] > max_shoe_size_value
				max_shoe_size_value = stats[:shoe]
				max_shoe_size_rebounds = stats[:rebounds]
			end
		end
	end

	max_shoe_size_rebounds
end

def most_points_scored
	most_points = 0
	most_points_player = nil
	game_hash.each do |location, team_data|
		team_data[:players].each do |player, stats|
			if stats[:points] > most_points
				most_points = stats[:points]
				most_points_player = player
			end
		end
	end

	most_points_player
end

def winning_team
	winning_team = nil
	winning_team_points = 0

	game_hash.each do |location, team_data|
		team_points = 0
		team_data[:players].each do |player, stats|
			team_points += stats[:points]
		end
		if team_points > winning_team_points
			winning_team_points = team_points
			winning_team = team_data[:team_name]
		end
	end

	winning_team
end

def player_with_longest_name
	longest_name_player = nil
	longest_name_length = 0

	game_hash.each do |location, team_data|
		team_data[:players].each do |player, stats|
			if player.size > longest_name_length
				longest_name_length = player.size
				longest_name_player = player
			end
		end
	end

	longest_name_player
end

def player_with_most_steals
	most_steals = 0
	most_steals_player = nil

	game_hash.each do |location, team_data|
		team_data[:players].each do |player, stats|
			if stats[:steals] > most_steals
				most_steals = stats[:steals]
				most_steals_player = player
			end
		end
	end

	most_steals_player
end

def long_name_steals_a_ton?
	player_with_longest_name == player_with_most_steals
end