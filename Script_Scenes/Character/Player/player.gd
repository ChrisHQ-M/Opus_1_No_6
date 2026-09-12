extends CharacterBody2D

# Constants to manage speed
const ACCELERATION : float = 2000.0
const SPEED = 200.0

# Variables for allowing movement
@onready var timer_movement : Timer = $TimerMovement
@onready var sprite_2d : AnimatedSprite2D = $sprite_2d_player
var can_move : bool = false


# Called when the node is created
func _ready() -> void:
	MovementSignal.movement_signal.connect(_on_movement_signal)

# Called every physics tick
func _physics_process(delta: float) -> void:
	_movement(delta)
	move_and_slide()

# Manages the player movement
func _movement(delta : float) -> void:
	if can_move == true:
		if Input.is_action_pressed("left"):
			velocity.x = move_toward(velocity.x, -SPEED, SPEED / 3.0)
			sprite_2d.play("walking_side")
			sprite_2d.flip_h = false
		elif Input.is_action_pressed("right"):
			velocity.x = move_toward(velocity.x, SPEED, SPEED / 3.0)
			sprite_2d.play("walking_side")
			sprite_2d.flip_h = true
		elif Input.is_action_pressed("up"):
			velocity.y = move_toward(velocity.y, -SPEED, SPEED / 3.0)
			sprite_2d.play("walking_back")
		elif Input.is_action_pressed("down"):
			velocity.y = move_toward(velocity.y, SPEED, SPEED / 3.0)
			sprite_2d.play("walking_front")
		else:
			velocity.x = move_toward(velocity.x, 0.0, ACCELERATION * delta * 2.0)
			velocity.y = move_toward(velocity.y, 0.0, ACCELERATION * delta * 2.0)
	else:
		velocity.x = move_toward(velocity.x, 0.0, ACCELERATION * delta * 2.0)
		velocity.y = move_toward(velocity.y, 0.0, ACCELERATION * delta * 2.0)
		sprite_2d.play("idle")

# On movement_signal, allows the player to move until the timer_movement's timeout
func _on_movement_signal() -> void:
	can_move = true
	timer_movement.start()

# Forbid the player to move until next movement_signal emission
func _on_timer_movement_timeout() -> void:
	can_move = false
