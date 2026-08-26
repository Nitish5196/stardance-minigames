extends Node2D

@onready var ramen_container: HBoxContainer = get_node_or_null("RamenContainer")
@onready var ramen_1: TextureRect = get_node_or_null("RamenContainer/Ramen1")
@onready var ramen_2: TextureRect = get_node_or_null("RamenContainer/Ramen2")
@onready var ramen_3: TextureRect = get_node_or_null("RamenContainer/Ramen3")
@onready var level: RichTextLabel = get_node_or_null("Level")
@onready var timer_label: RichTextLabel = get_node_or_null("timer")

var time: float = 5.0


func _ready() -> void:
	time = 5.0

	if level:
		level.text = "Level " + str(Global.minigames_done + 1)

	while time > 0.0:
		await get_tree().create_timer(0.1).timeout
		time -= 0.1

		if timer_label:
			timer_label.text = str(snapped(max(time, 0.0), 0.1))

	# The important part:
	# minigames_done only changes AFTER a win.
	var next_minigame = Global.minigames_done + 1

	var next_scene_path = "res://Scenes/minigame_" + str(next_minigame) + ".tscn"

	if ResourceLoader.exists(next_scene_path):
		get_tree().change_scene_to_file(next_scene_path)
	else:
		# We haven't created the next minigame yet.
		get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")


func _process(_delta: float) -> void:
	if ramen_container:
		match Global.lives:
			2:
				if ramen_1:
					ramen_1.hide()

			1:
				if ramen_1:
					ramen_1.hide()
				if ramen_2:
					ramen_2.hide()

			0:
				ramen_container.hide()
