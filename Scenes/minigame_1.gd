extends Node2D

var garlic_collected: int = 0
var total_garlic: int = 4

var time_left: float = 15.0
var game_finished := false


func _ready() -> void:
	garlic_collected = Global.collected_garlic.size()

	print("Ramen: ", garlic_collected, "/", total_garlic)
	print("Time: ", time_left)


func _process(delta: float) -> void:
	if game_finished:
		return

	time_left -= delta

	if time_left <= 0.0:
		time_left = 0.0
		lose_minigame()


func garlic_collect(garlic_name: String) -> void:
	if game_finished:
		return

	if not Global.collected_garlic.has(garlic_name):
		Global.collected_garlic.append(garlic_name)

	garlic_collected = Global.collected_garlic.size()

	print("Ramen: ", garlic_collected, "/", total_garlic)

	if garlic_collected >= total_garlic:
		win_minigame()


func win_minigame() -> void:
	game_finished = true

	print("YOU WIN!")

	# NOW we say that the minigame was completed.
	Global.minigames_done += 1

	# Clear the collected ramen because we're moving
	# to a completely new minigame.
	Global.collected_garlic.clear()

	get_tree().change_scene_to_file("res://Scenes/Timer_screen.tscn")


func lose_minigame() -> void:
	game_finished = true

	print("TIME'S UP!")

	Global.lives -= 1

	print("Lives: ", Global.lives)

	if Global.lives <= 0:
		print("GAME OVER")
		get_tree().change_scene_to_file("res://Scenes/title_screen.tscn")
	else:
		# DO NOT clear collected_garlic.
		# The collected ramen will stay gone when we retry.
		get_tree().change_scene_to_file("res://Scenes/Timer_screen.tscn")
