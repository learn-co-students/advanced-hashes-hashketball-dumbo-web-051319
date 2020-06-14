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

def team_colors(team_name)
  new_arr = []
  switch = false
  game_hash.each do |team, team_data|
    team_data.each do |name, team_data|
      if name.to_s == "team_name"
        if team_data[0] == team_name
          switch = true
        end
      end
      if name.to_s == "colors" && switch == true
        new_arr = team_data
        switch = false
      end
    end
  end
  new_arr
end


def team_names()
  new_arr = []
  game_hash.each do |team, find_name|
    find_name.each do |team_name, name_data|
      if team_name.to_s == "team_name"
        new_arr << name_data.join
      end
    end
  end
  new_arr
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



def player_stats (name)
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if attribute == :players
        data.collect do |player_name, player_data|
          if player_name.to_s == name
            return player_data
          end
        end
      end
    end
  end
end



def big_shoe_rebounds
  shoe = []
  i = 0
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if attribute == :players
        data.collect do |player_name, player_data|
            shoe << player_data[:shoe]
        end
      end
    end
  end
  i = shoe.sort[-1]
  game_hash.collect do |location, team_data|
    team_data.collect do |attribute, data|
      if attribute == :players
        data.collect do |player_name, player_data|
          if player_data[:shoe] == i
            return player_data[:rebounds]
          end
        end
      end
    end
  end
end
