extends Area2D

#const speed_bullet = 600
var velocity = Vector2.ZERO
#func _ready():
#	velocity = transform.x * speed_bullet

func _physics_process(delta):
  position += velocity * delta


func _on_Shoot_area_entered(area):
	if area.is_in_group("Enemy"):
		queue_free()
	
		


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()




