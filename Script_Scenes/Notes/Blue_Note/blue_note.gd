extends Note

@export var chp : int

# Enter and execute when the cursor enters in collision
func _behaviour_entered() -> void:
	if chp == 1:
		SoundManager.play_blue_note(-5.0, 0.0)
	else:
		SoundManager.play_blue_note_B(-5.0, 0.0)
		
	MovementSignal.movement_signal.emit()
	MovementSignal._addCpt()
