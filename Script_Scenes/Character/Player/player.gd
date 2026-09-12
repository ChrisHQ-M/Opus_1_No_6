extends CharacterBody2D

# Constants to manage speed
const ACCELERATION : float = 1500.0
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
func _movement(_delta : float) -> void:
	if can_move == true:
		if Input.is_action_just_pressed("left"):
			velocity.x = -SPEED
			sprite_2d.play("walking_side")
			sprite_2d.flip_h = false
		elif Input.is_action_just_pressed("right"):
			velocity.x = SPEED
			sprite_2d.play("walking_side")
			sprite_2d.flip_h = true
		elif Input.is_action_just_pressed("up"):
			velocity.y = -SPEED
			sprite_2d.play("walking_back")
		elif Input.is_action_just_pressed("down"):
			velocity.y = SPEED
			sprite_2d.play("walking_front")
	else:
		velocity = Vector2.ZERO
		sprite_2d.play("idle")

# On movement_signal, allows the player to move until the timer_movement's timeout
func _on_movement_signal() -> void:
	can_move = true
	timer_movement.start()

# Forbid the player to move until next movement_signal emission
func _on_timer_movement_timeout() -> void:
	can_move = false
