extends Node

func get_spawn_info():
	var spawns = []
  
	for child in get_children():
		print(child)
		var spawn = {
			"time_start": child.get_time_start(),
			"time_end": child.get_time_end(), 
			"enemy": child.get_enemy_resource(),
			"enemy_num": child.get_enemy_num(),
			"enemy_spawn_delay": child.get_enemy_spawn_delay()
			}
		
		spawns.append(spawn)
		
	return spawns


