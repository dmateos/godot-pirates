extends CharacterBody2D

@onready var _follow :PathFollow2D = get_parent()
@onready var ship_sprite = get_node("Ship")


var ship_damage_1 = preload("res://assets/ship_pirate_damage_1.png")
var ship_damage_2 = preload("res://assets/ship_pirate_damage_2.png")

var health :int = 3

func _ready():
	_follow.progress_ratio = 0
	var tween = create_tween().set_loops().set_speed_scale(0.1)
	tween.tween_property(_follow, 'progress_ratio', 1, 1)
	
func hit():
	health -= 1
	if health == 2:
		ship_sprite.set_texture(ship_damage_1)
	elif health == 1:
		ship_sprite.set_texture(ship_damage_2)
