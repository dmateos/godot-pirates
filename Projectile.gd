extends CharacterBody2D

@export var speed = 750
@onready var explosion_animation :AnimatedSprite2D = get_node("ExplosionAnimation")

func start(_position, _direction):
	rotation = _direction
	position = _position
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.get_collider().has_method("hit"):
			collision.get_collider().hit()
			explosion_animation.visible = true
			explosion_animation.play()
		else:
			velocity = velocity.bounce(collision.get_normal())

func _on_explosion_animation_animation_finished():
	queue_free()

func _on_off_screen_notifier_screen_exited():
	queue_free()
