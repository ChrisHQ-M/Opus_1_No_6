extends Node2D

@onready var parallax_layer : ParallaxLayer = $ParallaxBackground/ParallaxLayer

const SPEED : float = 20.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Moves the parallax sprite to the left based on SPEED
	parallax_layer.motion_offset.x -= SPEED * delta
