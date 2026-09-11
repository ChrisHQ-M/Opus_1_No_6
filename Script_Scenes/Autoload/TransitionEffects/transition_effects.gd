extends CanvasLayer

signal on_transition_finished

@onready var animation : AnimationPlayer = $AnimationTransition
@onready var sprite_2d : AnimatedSprite2D = $Sprite_2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	sprite_2d.visible = false
	
	# Connection between the AnimationPlayer and the method that manages it.
	animation.animation_finished.connect(_on_animation_finished)

# Called when an animation from the AnimationPlayer is finished.
func _on_animation_finished(anim_name : String) -> void:
	# At the end of the transition to black, emits a signal and fades back to normal.
	if anim_name == "fade_to_black_circle":
		on_transition_finished.emit()
		animation.play("fade_from_black_circle_to_normal")
	# When fading back to normal is over, disable the visibility of the sprite.
	elif anim_name == "fade_from_black_circle_to_normal":
		sprite_2d.visible = false

# Starts a fade to black circle transition.
func transition_black_circle() -> void:
	sprite_2d.visible = true
	animation.play("fade_to_black_circle")
