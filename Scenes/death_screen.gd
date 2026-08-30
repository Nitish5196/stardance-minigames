extends Control

func _on_retry_pressed() ->void :
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
	# Reset game state
	Global.lives = 5
	Global.minigames_done = 0
	
	# Start the game again
	
