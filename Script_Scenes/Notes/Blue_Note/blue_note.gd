extends AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	play("default")

# When the Musical Gauge's cursor goes through the note, emits movement_signal
func _on_area_2d_area_entered(area: Area2D) -> void:
	if area != null && area.is_in_group("Cursor"):
		MovementSignal.movement_signal.emit()
