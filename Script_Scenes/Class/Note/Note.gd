class_name Note
extends AnimatedSprite2D

@export var speed : float = 15.0
var direction_x : float = 1.0

@export var timer_change_dir : float = 0.75
var timer : float = 0.0

var can_move : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play("default")

func _process(delta: float) -> void:
	# Movement manager
	if can_move == true:
		timer += delta
		
		# Change direction and reset timer once it reaches the max time
		if timer >= timer_change_dir:
			direction_x *= -1.0
			timer = 0.0
			
		global_position.x += speed * direction_x * delta

# When the Musical Gauge's cursor goes through the note, emits movement_signal
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area != null && area.is_in_group("Cursor"):
		_behaviour_entered()

# Activates or disables movement
func _setCanMove(mode : bool) -> void:
	can_move = mode

# Method to write for all notes
func _behaviour_entered() -> void:
	pass
