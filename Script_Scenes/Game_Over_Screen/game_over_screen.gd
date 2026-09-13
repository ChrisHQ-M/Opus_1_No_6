extends Control

var btn_pressed : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false

# Reload the chapter when pressed
func _on_try_again_btn_pressed() -> void:
	if btn_pressed == false:
		btn_pressed = true
		SoundManager.play_click_sfx(0.0, 0.0)
		
		TransitionEffects.transition_black_circle()
		await TransitionEffects.on_transition_finished
		
		get_tree().paused = false
		get_tree().reload_current_scene()


# Back to menu when pressed
func _on_back_to_menu_btn_pressed() -> void:
	if btn_pressed == false:
		btn_pressed = true
		SoundManager.play_click_sfx(0.0, 0.0)
		
		TransitionEffects.transition_black_circle()
		await TransitionEffects.on_transition_finished

		get_tree().paused = false
		get_tree().change_scene_to_file("res://Script_Scenes/Main_Menu/menu_scene.tscn")
