extends Node2D
@onready var ramen_container: HBoxContainer = $RamenContainer
@onready var ramen_1: TextureRect = $RamenContainer/Ramen1
@onready var ramen_2: TextureRect = $RamenContainer/Ramen2
@onready var ramen_3: TextureRect = $RamenContainer/Ramen3
@onready var level: RichTextLabel = $Level
@onready var timer: RichTextLabel = $timer

var time: float = 0.0

func _ready() -> void:
	await Timer(5.0)
	
	if Global.minigames_done < 3:
		Global.minigames_done = Global.minigames_done + 1
		get_tree().change_scene_to_file("res://Scenes/minigame_" + str(Global.minigames_done) + ".tscn")
	else:
		get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")

func _process(_delta: float) -> void:
	match Global.lives:
		2:
			ramen_1.hide()
		1:
			ramen_1.hide()
			ramen_2.hide()
		0:
			ramen_container.hide()
	
	timer.text = str(snapped(time, 0.1))
	level.text = "Level " + str(Global.minigames_done + 1)

func Timer(start_time: float):
	time = start_time
	while time > 0.0:
		await wait(0.1)
		time -= 0.1
	return

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
