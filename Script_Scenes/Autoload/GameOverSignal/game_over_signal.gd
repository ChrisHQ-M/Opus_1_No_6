extends Node

var nbTry : int = 1

# Emits when it's game over
signal game_over_signal

func getNbTry() -> int:
	return nbTry
	
func addNbTry() -> void:
	nbTry += 1
