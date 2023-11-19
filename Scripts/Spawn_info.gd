# Spawn_info.gd
class_name Spawn_info

export var time_start : int
export var time_end : int
export var enemy : PackedScene
export var enemy_num : int
export var enemy_spawn_delay : int
var spawn_delay_counter : int = 0

func set_time_start(value):
	time_start = value

func get_time_start():
	return time_start
	
func set_time_end(value):
	time_end = value

func get_time_end():
	return time_end

func set_enemy(value):
	enemy = value

func get_enemy():
	return enemy

func set_enemy_num(value):
	enemy_num = value

func get_enemy_num():
	return enemy_num

func set_enemy_spawn_delay(value):
	enemy_spawn_delay = value

func get_enemy_spawn_delay():
	return enemy_spawn_delay
