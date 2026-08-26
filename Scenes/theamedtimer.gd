extends Node2D

@onready var timer_label: RichTextLabel = get_node_or_null("timer")
var time: float = 0.0

func Timer(start_time: float) -> void:
	time = start_time
	while time > 0.0:
		if timer_label:
			timer_label.text = str(snapped(time, 0.1))
		await get_tree().create_timer(0.1).timeout
		time -= 0.1
	return
