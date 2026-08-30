extends Control


func _on_play_again_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
	# Reset everything for a completely new game
	Global.lives = 5
	Global.minigames_done = 0

	
