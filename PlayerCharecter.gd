extends CharacterBody2D

@export var speed = 400
@export var rotation_speed = 1.5

var rotation_direction = 0

var Bullet = preload("res://cannon_ball.tscn")


func get_input():
	rotation_direction = Input.get_axis("left", "right")
	velocity = transform.x * Input.get_axis("down", "up") * speed
	
	if Input.is_action_just_pressed("shoot"):
		shoot()

func shoot():
	var b = Bullet.instantiate()
	
	b.start($CannonEnd.global_position, rotation)
	get_parent().add_child(b)

func _physics_process(delta):
	get_input()
	rotation += rotation_direction * rotation_speed * delta
	set_rotation(rotation)
	move_and_slide()
	
func hit():
	print("player ouch")
