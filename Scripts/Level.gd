extends Node2D

var rand_x
var rand_y
export (PackedScene) var Asteroid

func _ready():
	randomize()
	for _i in range(200):
		var asteroid = Asteroid.instance()
		rand_x = rand_range(-2000,2000)
		rand_y = rand_range(-2000,2000)
		asteroid.global_position = Vector2(rand_x, rand_y)
		add_child(asteroid)
