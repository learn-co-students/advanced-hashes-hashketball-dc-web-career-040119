def game_hash
{# Write your code here!
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
  :colors => ["Purple", "Turquoise"],
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

  game_hash.each do |place, team|
    team.each do |attribute, value|
      if attribute == :players
        value.each do |person, data|
          if person == player_name
            data.each do |stat, num|
              if stat == :points
                return num
          end
        end
      end
    end
  end
end
end
end

def shoe_size(player_name)
  game_hash.each do |place, team|
    team.each do |attribute, value|
      if attribute == :players
        value.each do |person, data|
          if person == player_name
            data.each do |stat, num|
              if stat == :shoe
                return num
              end
            end
          end
        end
      end
      end
      end
      end


      def team_colors(team_name)
   game_hash.each do |place, team|
     if team[:team_name] == team_name
       return team[:colors]
     end
   end
 end


def team_names
  nu_arr = []
  game_hash. each do |place, team|
    nu_arr << team[:team_name]
  end
  return nu_arr
end


def player_numbers(team_name)
  nu_arr = []
  game_hash.each do |place, team|
    if team[:team_name]  == team_name
      team[:players].each do |player_name, player|
        nu_arr << player[:number]
          end
        end
      end
      return nu_arr
    end

def player_stats(name)
  game_hash.each do |place, team|
    team[:players].each do |player_name, player|
      if player_name == name
        return player
      end
    end
  end
end

def big_shoe_rebounds
  big_shoe = 0
  rebounds = 0
  game_hash.each do |place,team|
    team[:players].each do |player_name, player|
    if player[:shoe] > big_shoe
      big_shoe = player[:shoe]
      rebounds = player[:rebounds]
        end
      end
    end
  rebounds
end
