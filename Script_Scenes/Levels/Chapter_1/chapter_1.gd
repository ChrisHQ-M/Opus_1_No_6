extends Control

var music_chp_1 : AudioStream = preload("res://Sounds/Musics/No_2.mp3")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SoundManager.play_music(music_chp_1, true)
