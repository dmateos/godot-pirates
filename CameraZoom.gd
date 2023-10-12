extends Camera2D

# The camera's target zoom level.
@export var zoom_level := 0.1


func _unhandled_input(event):
	if event.is_action_pressed("zoom in"):
		zoom.x += zoom_level
		zoom.y += zoom_level
	if event.is_action_pressed("zoom out"):
		zoom.x -= zoom_level
		zoom.y -= zoom_level
