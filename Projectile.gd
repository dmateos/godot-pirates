extends CharacterBody2D

@export var speed = 750
@onready var explosion_animation :AnimatedSprite2D = get_node("ExplosionAnimation")

var hit :bool = false

func start(_position, _direction):
	rotation = _direction
	position = _position
	velocity = Vector2(speed, 0).rotated(rotation)

func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.get_collider().has_method("hit") and not hit:
			collision.get_collider().hit()
			hit = true
			explosion_animation.visible = true
			explosion_animation.play()
		elif not hit:
			velocity = velocity.bounce(collision.get_normal())

func _on_explosion_animation_animation_finished():
	queue_free()

func _on_off_screen_notifier_screen_exited():
	queue_free()
