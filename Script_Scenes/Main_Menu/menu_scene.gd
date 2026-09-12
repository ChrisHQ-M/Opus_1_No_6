extends Control

var main_theme : AudioStream = preload("res://Sounds/Musics/Opus_1_No_6_(partially restored).mp3")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	# Plays the main theme of the main menu.
	SoundManager.play_music(main_theme, true)

# On Play_btn pressed
func _on_play_btn_pressed() -> void:
	TransitionEffects.transition_black_circle()
	await TransitionEffects.on_transition_finished
	
	get_tree().change_scene_to_file("res://Script_Scenes/Levels/Chapter_1/chapter_1.tscn")
	
# On Settings_btn pressed
func _on_settings_btn_pressed() -> void:
	TransitionEffects.transition_black_circle()
	await TransitionEffects.on_transition_finished
