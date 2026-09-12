extends Control

var music_chp_1 : AudioStream = preload("res://Sounds/Musics/No_2.mp3")

@onready var game_over_screen : Control = $UI/Game_Over_Screen

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SoundManager.play_music(music_chp_1, true)
	GameOverSignal.game_over_signal.connect(_on_game_over_signal)

func _on_game_over_signal() -> void:
	game_over_screen.visible = true
	get_tree().paused = true
