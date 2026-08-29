extends Control


func _on_play_again_pressed() -> void:
	# Reset everything for a completely new game
	Global.lives = 3
	Global.minigames_done = 0

	get_tree().change_scene_to_file(
		"res://Scenes/timer_screen.tscn"
	)
