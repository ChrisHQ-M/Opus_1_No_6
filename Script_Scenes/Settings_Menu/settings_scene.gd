extends Control

func _on_back_to_menu_btn_pressed() -> void:
	SoundManager.play_click_sfx(0.0, 0.0)
	
	TransitionEffects.transition_black_circle()
	await TransitionEffects.on_transition_finished
	
	get_tree().change_scene_to_file("res://Script_Scenes/Main_Menu/menu_scene.tscn")
