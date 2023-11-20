extends Node2D


func _on_Play_button_down():
	get_tree().change_scene("res://Scene/Level.tscn")
	


func _on_Quit_button_down():
	get_tree().quit()
