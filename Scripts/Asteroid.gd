extends Area2D

var velocity = Vector2.ZERO
var speed = 2
var asteroid_hp = 3

func _ready():
	randomize()
	var x = rand_range(-100,100)
	var y = rand_range(-100,100)
	velocity = Vector2(x,y)
	

func _physics_process(delta):
	position += velocity * speed * delta 
	
func _on_VisibilityNotifier2D_screen_exited():
	$Timer.start()
	queue_free()


func _on_Asteroid_area_entered(area):
	if area.is_in_group("Shoot"):
		asteroid_hp -= 1
		if asteroid_hp == 0:
			queue_free()

func _on_Asteroid_body_entered(body):
	if body.is_in_group("Player"):
		queue_free()
		body.hp -= 1
		if  body.hp == 0:
			body.queue_free()
