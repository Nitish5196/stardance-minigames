extends Node2D

@onready var settings_popup: Control = $"Settings popup"
@onready var music_button: Button = $"Settings popup/VBoxContainer/MusicButton"

var music_bus_index: int

func _ready() -> void:
	settings_popup.hide()
	music_bus_index = AudioServer.get_bus_index("Music")
	update_button_text()

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/level_screen.tscn")

func _on_settings_pressed() -> void:
	settings_popup.show()

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_music_button_pressed() -> void:
	var is_muted = AudioServer.is_bus_mute(music_bus_index)
	AudioServer.set_bus_mute(music_bus_index, not is_muted)
	update_button_text()

func _on_close_button_pressed() -> void:
	settings_popup.hide()

func update_button_text() -> void:
	var is_muted = AudioServer.is_bus_mute(music_bus_index)
	if is_muted:
		music_button.text = "Music: OFF"
	else:
		music_button.text = "Music: ON"
