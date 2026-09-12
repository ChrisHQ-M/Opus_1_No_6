extends Note

# Emits a signal allowing turrets to attack
func _behaviour_entered() -> void:
	SoundManager.play_red_note(-3.0, 0.0)
	MovementSignal.turret_atk_signal.emit()
	MovementSignal._addCpt()
