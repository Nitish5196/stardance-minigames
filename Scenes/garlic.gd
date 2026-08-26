extends Node2D

var collected := false

func _ready() -> void:
	# If this ramen was collected during an earlier attempt,
	# don't show it again.
	if Global.collected_garlic.has(name):
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player" and not collected:
		collected = true

		var main_level = get_tree().current_scene

		if main_level.has_method("garlic_collect"):
			main_level.garlic_collect(name)

		queue_free()
