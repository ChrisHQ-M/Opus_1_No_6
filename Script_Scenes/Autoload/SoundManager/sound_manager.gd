extends Node

@onready var music : AudioStreamPlayer = $AudioMusic

var list_blue_note_sfx : Array[AudioStream] = [preload("res://Sounds/SFX/Note_SFX/Blue_Note_SFX/blue_note_sfx_1.mp3"),
preload("res://Sounds/SFX/Note_SFX/Blue_Note_SFX/blue_note_sfx_2.mp3"),
preload("res://Sounds/SFX/Note_SFX/Blue_Note_SFX/blue_note_sfx_3.mp3"),
preload("res://Sounds/SFX/Note_SFX/Blue_Note_SFX/blue_note_sfx_4.mp3"),
preload("res://Sounds/SFX/Note_SFX/Blue_Note_SFX/blue_note_sfx_5.mp3"),
preload("res://Sounds/SFX/Note_SFX/Blue_Note_SFX/blue_note_sfx_6.mp3"),
preload("res://Sounds/SFX/Note_SFX/Blue_Note_SFX/blue_note_sfx_7.mp3")]
var len_list_blue_note : int

var list_blue_note_sfx_B : Array[AudioStream] = [preload("res://Sounds/SFX/Note_SFX/Blue_Note_SFX/No_2/blue_note_sfx_B1.mp3"),
preload("res://Sounds/SFX/Note_SFX/Blue_Note_SFX/No_2/blue_note_sfx_B2.mp3"),
preload("res://Sounds/SFX/Note_SFX/Blue_Note_SFX/No_2/blue_note_sfx_B3.mp3"),
preload("res://Sounds/SFX/Note_SFX/Blue_Note_SFX/No_2/blue_note_sfx_B4.mp3")]
var len_list_blue_note_B : int

var list_red_note_sfx : Array[AudioStream] = [preload("res://Sounds/SFX/Note_SFX/Red_Note/red_note_sfx_1.mp3"),
preload("res://Sounds/SFX/Note_SFX/Red_Note/red_note_sfx_2.mp3"),
preload("res://Sounds/SFX/Note_SFX/Red_Note/red_note_sfx_3.mp3"),
preload("res://Sounds/SFX/Note_SFX/Red_Note/red_note_sfx_4.mp3"),
preload("res://Sounds/SFX/Note_SFX/Red_Note/red_note_sfx_5.mp3"),
preload("res://Sounds/SFX/Note_SFX/Red_Note/red_note_sfx_6.mp3")]
var len_list_red_note : int

var click_sfx = preload("res://Sounds/SFX/Click_SFX/click_sfx.ogg")

func _ready() -> void:
	len_list_blue_note = len(list_blue_note_sfx) - 1
	len_list_red_note = len(list_red_note_sfx) - 1
	len_list_blue_note_B = len(list_blue_note_sfx_B) - 1

# Plays one music in the node's stream "AudioMusic" with a loop option and returns the node.
func play_music(stream : AudioStream, loop : bool) -> AudioStreamPlayer:
	if music.stream == stream:
		return
	
	# Configurations of the music node
	music.stream = stream
	music.stream.loop = loop
	music.bus = "Music"
	music.play()
	
	return music

# Create an AudioStreamPlayer that frees after playing a SFX. Can change the volume_db and pitch_scale and returns the node.
func play_sfx(stream : AudioStream, vol_db : float, pitch_scale : float) -> AudioStreamPlayer:
	var new_sfx : AudioStreamPlayer = AudioStreamPlayer.new()
	add_child(new_sfx)
	
	# Configurations of the SFX node
	if stream != null:
		new_sfx.stream = stream
		new_sfx.volume_db += vol_db
		new_sfx.pitch_scale += pitch_scale
		new_sfx.bus = "SFX"
		new_sfx.play()
	
	return new_sfx

# Plays a random blue note sound and returns the AudioStreamPlayer node associated
func play_blue_note(vol_db : float, pitch_scale : float) -> AudioStreamPlayer:
	return play_sfx(list_blue_note_sfx[randi() % len_list_blue_note], vol_db, pitch_scale)
	
func play_blue_note_B(vol_db : float, pitch_scale : float) -> AudioStreamPlayer:
	return play_sfx(list_blue_note_sfx_B[randi() % len_list_blue_note_B], vol_db, pitch_scale)

func play_red_note(vol_db : float, pitch_scale : float) -> AudioStreamPlayer:
	return play_sfx(list_red_note_sfx[randi() % len_list_red_note], vol_db, pitch_scale)

func play_click_sfx(vol_db : float, pitch_scale : float) -> AudioStreamPlayer:
	return play_sfx(click_sfx, vol_db - 5.0, pitch_scale)
