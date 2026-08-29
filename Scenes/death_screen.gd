extends Control

func _on_retry_pressed() -> void:
	# Reset game state
	Global.lives = 3
	Global.minigames_done = 0
	
	# UNPAUSE THE TREE!
	get_tree().paused = false
	
	# Start the game again
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
