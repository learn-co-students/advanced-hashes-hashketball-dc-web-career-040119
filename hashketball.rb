# Write your code here!
require "pry"

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: "Black, White",
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
    away: {
      team_name: "Charlotte Hornets",
      colors: "Turquoise, Purple",
      players:{
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
  points = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players && data.has_key?(player)
          points = game_hash[location][attribute][player][:points]
      end
    end
  end

  points
end

def shoe_size(player)
  shoe_size = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players && data.has_key?(player)
          shoe_size = game_hash[location][attribute][player][:shoe]
      end
    end
  end

  shoe_size
end

def team_colors(team)
  colors = []

  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      colors = game_hash[location][:colors].split(", ")
    end
  end

  colors
end

def team_names
  game_hash.collect do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team)
  numbers = []

  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data.each do |attribute, data|
        if attribute == :players
          data.each do |player, player_data|
            numbers << player_data[:number]
          end
        end
      end
    end
  end

  numbers
end

def player_stats(player)
  stats = {}

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players && data.has_key?(player)
          stats = data[player]
      end
    end
  end

  stats
end


def big_shoe_rebounds
  biggest_shoe = 0
  rebounds = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, player_data|
          if player_data[:shoe] > biggest_shoe
            biggest_shoe = player_data[:shoe]
            rebounds = player_data[:rebounds]
          end
        end
      end
    end
  end

  rebounds
end

def most_points_scored
  most_points = 0
  player_with_most_points = ""

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, player_data|
          if player_data[:points] > most_points
            player_with_most_points = player
            most_points = player_data[:points]
          elsif player_data[:points] == most_points
            player_with_most_points << ", #{player}"
          end
        end
      end
    end
  end

  player_with_most_points
end

def winning_team
  home_points = 0
  away_points = 0

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, player_data|
          if location == :home
            home_points += player_data[:points]
          else
            away_points += player_data[:points]
          end
        end
      end
    end
  end

  if home_points > away_points
    game_hash[:home][:team_name]
  else
    game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  longest_name = ""

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, player_data|
          if player.length > longest_name.length
            longest_name = player
          end
        end
      end
    end
  end

  longest_name
end

def long_name_steals_a_ton?
  most_steals = 0
  player_with_most_steals = ""

  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |player, player_data|
          if player_data[:steals] > most_steals
            most_steals = player_data[:steals]
            player_with_most_steals = player
          end
        end
      end
    end
  end

  player_with_most_steals == player_with_longest_name
end
