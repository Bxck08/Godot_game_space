extends KinematicBody2D

export (PackedScene) var Shoot

var hp = 3
var time_bullet = 0.3
var can_shoot = true
const max_speed = 200
const speed_bullet = 600
const accel = 1500
const friction = 600
var velocity = Vector2.ZERO

var input = Vector2.ZERO

func _physics_process(delta):
	look_at(get_global_mouse_position())
	player_movement(delta)


func _input(event):
	if (event.is_action_pressed("shoot") and can_shoot):
		shoot_ctrl()
		
		
func get_input():
	input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	return input.normalized()


func player_movement(delta):
	input = get_input()
	
	if input == Vector2.ZERO:
		if velocity.length() > (friction * delta):
			velocity -= velocity.normalized() * (friction * delta)
		else:
			velocity = Vector2.ZERO
	else:
		velocity += (input * accel * delta)
		velocity = velocity.limit_length(max_speed)
		
	move_and_slide(velocity)

func shoot_ctrl():
	var new_bullet = Shoot.instance()
	get_tree().call_group("Level",'add_child',new_bullet)
	new_bullet.velocity = transform.x * speed_bullet	
	new_bullet.position = $Position2D.global_position
	#new_bullet.look_at(get_global_mouse_position())
	$Timer.set_wait_time(time_bullet)
	$Timer.start()
	

func _on_Timer_timeout():
	can_shoot = true
