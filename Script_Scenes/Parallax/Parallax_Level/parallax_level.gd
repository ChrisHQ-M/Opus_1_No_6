extends Node2D

@onready var parallax_layer_bg : ParallaxLayer = $ParallaxBackground/ParallaxLayerBG
@onready var parallax_layer_clouds : ParallaxLayer = $ParallaxBackground/ParallaxLayerClouds

const SPEED : float = 20.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	# Moves the parallax sprite to the left based on SPEED
	parallax_layer_bg.motion_offset.x -= SPEED * delta
	parallax_layer_clouds.motion_offset.x -= SPEED * 1.5 * delta
