extends Note

# Enter and execute when the cursor enters in collision
func _behaviour_entered() -> void:
	SoundManager.play_blue_note(-5.0, 0.0)
	MovementSignal.movement_signal.emit()
	MovementSignal._addCpt()
