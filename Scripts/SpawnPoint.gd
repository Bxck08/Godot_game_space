extends Node2D

export var time_start : int = 0 
export var time_end : int = 0
export var enemy_scene : PackedScene
export var enemy_num : int = 5
export var spawn_delay : int = 2

func get_time_start() -> int:
	return time_start

func get_time_end() -> int:
	return time_end  

func get_enemy_resource() -> PackedScene:
	return enemy_scene

func get_enemy_num() -> int:
	return enemy_num

func get_enemy_spawn_delay() -> int:
	return spawn_delay
