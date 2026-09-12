extends StaticBody2D

@export var SPEED : float = 80.0
@export var direction_y : float = 1.0
@export var direction_x : float = 0.0

var ms_y : float = 0.0
var ms_x : float = 0.0

@export var wait_time : float = 2.0
@onready var timer_dir : Timer = $TimerDir

@onready var sprite : AnimatedSprite2D = $sprite_2d

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite.play("default")
	
	# Configures the timer to change direction between up and down
	timer_dir.wait_time = wait_time
	timer_dir.start()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# Moves the spike
	ms_y = move_toward(ms_y, SPEED * direction_y, SPEED / 10.0)
	global_position.y += delta * ms_y
	
	ms_x = move_toward(ms_x, SPEED * direction_x, SPEED / 10.0)
	global_position.x += delta * ms_x

# Each wait_time sec, changes the direction
func _on_timer_dir_timeout() -> void:
	direction_y *= -1.0
	direction_x *= -1.0

# When in contact with the player, starts the game over
func _on_area_dmg_body_entered(body: Node2D) -> void:
	if body != null && body.is_in_group("Player"):
		GameOverSignal.game_over_signal.emit()
