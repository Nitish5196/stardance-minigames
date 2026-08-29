extends Control


func _on_retry_pressed() -> void:
	# Reset the game back to its starting state
	Global.lives = 3
	Global.minigames_done = 0

	# Start the game again
	get_tree().change_scene_to_file(
		"res://Scenes/timer_screen.tscn"
	)
