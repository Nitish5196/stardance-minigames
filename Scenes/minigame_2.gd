extends Node2D

@onready var themed_timer: Node2D = $ThemedTimer

var buttons_pressed := 0
var timer_end = false

func _ready() -> void:
	await themed_timer.Timer(7.0)
	# After timer finishes, trigger lose condition if buttons aren't pressed
	timer_end = true 

func _process(delta: float) -> void:
	# Only check if they WON
	if buttons_pressed == 4:
		get_tree().change_scene_to_file("res://Scenes/win_screen.tscn")
	
	# If time ran out before getting 4 buttons
	if timer_end:
		Global.lives -= 1
		Global.minigames_done -= 1
		get_tree().change_scene_to_file("res://Scenes/level_screen.tscn") # or level_screen.tscn
