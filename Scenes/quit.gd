extends Control

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_screen.tscn")

func _on_settings_pressed() -> void:
	print("Settings clicked!")

func _on_quit_pressed() -> void:
	get_tree().quit()
