extends Control

@export var music_chp : AudioStream

@export var game_over_screen : Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SoundManager.play_music(music_chp, true)
	GameOverSignal.game_over_signal.connect(_on_game_over_signal)

func _on_game_over_signal() -> void:
	GameOverSignal.addNbTry()
	game_over_screen.visible = true
	get_tree().paused = true
