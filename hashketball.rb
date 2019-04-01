require "pry"
# Write your code here!
def game_hash
  game_analysis= {
    :home => {
      :team_name => "Brooklyn Nets", :colors => ["Black", "White"], :players => {"Alan Anderson" => {:number => '0', :shoe => '16', :points => '22', :rebounds => '12', :assists => '12', :steals => '3', :blocks => '1', :slam_dunks => '1'}, "Reggie Evans" => {:number => '30', :shoe => '14', :points => '12', :rebounds => '12', :assists => '12', :steals => '12', :blocks => '12', :slam_dunks => '7'}, "Brook Lopez" => {:number => '11', :shoe => '17', :points => '17', :rebounds => '19', :assists => '10', :steals => '3', :blocks => '1', :slam_dunks => '15'}, "Mason Plumlee" => {:number => '1', :shoe => '19', :points => '26', :rebounds => '12', :assists => '6', :steals => '3', :blocks => '8', :slam_dunks => '5'}, "Jason Terry" => {:number => '31', :shoe => '15', :points => '19', :rebounds => '2', :assists => '2', :steals => '4', :blocks => '11', :slam_dunks => '1'}}
    } , :away => {
      :team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"], :players => {"Jeff Adrien" => {:number => '4', :shoe => '18', :points => '10', :rebounds => '1', :assists => '1', :steals => '2', :blocks => '7', :slam_dunks => '2'}, "Bismak Biyombo" =>{:number => '0', :shoe => '16', :points => '12', :rebounds => '4', :assists => '7', :steals => '7', :blocks => '15', :slam_dunks => '10'}, "DeSagna Diop" => {:number => '2', :shoe => '14', :points => '24', :rebounds => '12', :assists => '12', :steals => '4', :blocks => '5', :slam_dunks => '5'}, "Ben Gordon" => {:number => '8', :shoe => '15', :points => '33', :rebounds => '3', :assists => '2', :steals => '1', :blocks => '1', :slam_dunks => '0'}, "Brendan Haywood" => {:number => '33', :shoe => '15', :points => '6', :rebounds => '12', :assists => '12', :steals => '22', :blocks => '5', :slam_dunks => '12'}}
    }
  }
end

def num_points_scored(player_name)
  score= ""
  game= game_hash
  
  game.each do |location, team|
   
    team.each do |attribute, data|
         if attribute == :players
            
    data.each do |players_key, players_value|
            if players_key == player_name
              score= players_value[:points]
            end 
          end
       end
    end
  end
  score.to_i
end

def shoe_size(player_name)
  sh_size= ""
  game= game_hash
  
  game.each do |location, team|
   
    team.each do |attribute, data|
         if attribute == :players
            
    data.each do |players_key, players_value|
            if players_key == player_name
              sh_size= players_value[:shoe]
            end 
          end
       end
    end
  end
  sh_size.to_i
end

def team_colors(team_name)
  ret_value= []
  game= game_hash
  top_level_hash_key= game.keys
  
  
  game.each do |location, team|
  
     team.each do |attribute, data|
    
        if game[location][attribute] == team_name
         # binding.pry
          ret_value.concat(game[location][:colors])
      end
    end
  end
  ret_value
end

def team_names
  ret_arr= []
  
  game= game_hash
  ret_arr[0]= game[:home][:team_name]
  ret_arr[1]= game[:away][:team_name]
 # binding.pry
 return  ret_arr
end

def player_numbers(t_name)
  playernum_arr= []
  player_stat= []
  ret_player_number= []
  game= game_hash
  
  game.each do |location, team|
    if location == :home && game[location].values.include?(t_name)
     
    playernum_arr.concat(team.values)
  elsif location == :away && game[location].values.include?(t_name)
     #binding.pry
    playernum_arr.concat(team.values)
  else
    'Sorry, #{t_name} is not found.'
    end
  end
  
  if playernum_arr[0] == t_name
    player_stat.concat(playernum_arr[2].values)
    
    player_stat.each do |player|
      
      player.each do |key, val|
        if key == :number
          ret_player_number<< val.to_i
        end
       # binding.pry
      end
    end
  end
  ret_player_number.sort!
end

def player_stats(player_name)
  game= game_hash
  new_h= {}
  ret_player_stat= []
   game.each do |location, team|
    #if location == :home && game[location].values.include?(t_name)
  #end
  #binding.pry
  team.each do |attribute, data|
   
    if attribute == :players
      
      data.each do |player_n, player_st|
        if player_n == player_name
          arr_k= player_st.keys
          arr_v= player_st.values.map!{|val| val.to_i}
          count= 0
          len= arr_k.length
          while count < len
           new_h.store(arr_k[count], arr_v[count])
           count+= 1
        end
         
        ret_player_stat<< new_h
      end
    end
    #binding.pry 
    end
  end
end
ret_player_stat[-1]
#binding.pry 
end

def big_shoe_rebounds
  compare_arr= []
  ret_val_arr= []
  game= game_hash
  
  game.each do |location, team|
    
    team.each do |attribute, data|
      
      if attribute == :players
        data_stats= data.values
       data_stats.each do |player_st|
         player_st.each do |key, val|
           if key == :shoe
             compare_arr<< val
         end
        end
       end
       biggest_feet= compare_arr.max
          
          data_stats.each do |p_k|
            p_k.each do |player_k, player_v|
               
               if player_k == :shoe && player_v == biggest_feet
                ret_val_arr<< p_k[:rebounds]
               end
            end
        end
      end
    end
  end
  ret_val_arr[-1].to_i
   #binding.pry
end



