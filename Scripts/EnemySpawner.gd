# EnemySpawner.gd

extends Node2D

var spawns = []
var pos_side_array = ["up", "down", "right", "left"]
var rng = RandomNumberGenerator.new()
const Spawn_info = preload("res://Scripts/Spawn_info.gd")

onready var player = get_tree().get_nodes_in_group("Player")[0]

var time = 0

func _ready():
	for spawn in get_node("../SpawnLocations").get_children():
		var spawn_info = Spawn_info.new()
		print(spawn.get_time_start())
		spawn_info.time_start = spawn.get_time_start()
		spawn_info.time_end = spawn.get_time_end()
		spawn_info.enemy = spawn.get_enemy_resource()
		spawn_info.enemy_num = spawn.get_enemy_num()
		spawn_info.enemy_spawn_delay = spawn.get_enemy_spawn_delay()
		print(spawn_info)
		spawns.append(spawn_info)

func _on_Timer_timeout():
	time += 1
	var enemy_spawns = spawns
	for i in enemy_spawns:
		if time >= i.time_start and time <= i.time_end:
			if i.spawn_delay_counter < i.enemy_spawn_delay:
				i.spawn_delay_counter += 1
			else:
				i.spawn_delay_counter = 0
				var new_enemy = i.get_enemy()
				var counter = 0
				while counter < i.enemy_num:
					var new_enemy_scene = i.get_enemy()
					var new_enemy_instance = new_enemy_scene.instance() 
					new_enemy_instance.global_position = get_random_position()
					add_child(new_enemy_instance)
					counter += 1

func get_random_position():
	var vpr = get_viewport_rect().size * rng.randf_range(1.1, 1.4)
	var top_left = Vector2(player.global_position.x - vpr.x / 2, player.global_position.y - vpr.y / 2)
	var top_right = Vector2(player.global_position.x + vpr.x / 2, player.global_position.y - vpr.y / 2)
	var bottom_left = Vector2(player.global_position.x - vpr.x / 2, player.global_position.y + vpr.y / 2)
	var bottom_right = Vector2(player.global_position.x + vpr.x / 2, player.global_position.y + vpr.y / 2)
	var pos_side = pos_side_array[randi() % pos_side_array.size()]
	var spawn_pos1 = Vector2.ZERO
	var spawn_pos2 = Vector2.ZERO
	
	match pos_side:
		"up":
			spawn_pos1 = top_left
			spawn_pos2 = top_right
		"down":
			spawn_pos1 = bottom_left
			spawn_pos2 = bottom_right
		"right":
			spawn_pos1 = top_right
			spawn_pos2 = bottom_right
		"left":
			spawn_pos1 = top_left
			spawn_pos2 = bottom_left
	
	var x_spawn = rng.randf_range(spawn_pos1.x, spawn_pos2.x)
	var y_spawn = rng.randf_range(spawn_pos1.y, spawn_pos2.y)
	return Vector2(x_spawn, y_spawn)
