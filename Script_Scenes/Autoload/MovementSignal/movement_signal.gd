extends Node

var move_signal_cpt : int = 0

# Called when the player is allowed to move
signal movement_signal
signal turret_atk_signal

func _reset_cpt() -> void:
	move_signal_cpt = 0
	
func _getCpt() -> int:
	return move_signal_cpt

func _addCpt() -> void:
	move_signal_cpt += 1
