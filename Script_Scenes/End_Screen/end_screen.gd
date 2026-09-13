extends Control

@onready var timer_change : Timer = $TimerChange

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer_change.start()

# Goes back to the menu scene
func _on_timer_change_timeout() -> void:
	TransitionEffects.transition_black_circle()
	await TransitionEffects.on_transition_finished
	
	get_tree().change_scene_to_file("res://Script_Scenes/Main_Menu/menu_scene.tscn")
