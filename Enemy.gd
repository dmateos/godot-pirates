extends CharacterBody2D

@onready var _follow :PathFollow2D = get_parent()

func _ready():
	_follow.progress_ratio = 0
	var tween = create_tween().set_loops().set_speed_scale(0.1)
	tween.tween_property(_follow, 'progress_ratio', 1, 1)
	
func hit():
	print("enemy ouch")
