extends Note

# Emits a signal allowing turrets to attack
func _behaviour_entered() -> void:
	SoundManager.play_red_note(-3.0, 0.0)
	
	# Emits a signal to allow turrets to shoot bullets
	MovementSignal.turret_atk_signal.emit()
