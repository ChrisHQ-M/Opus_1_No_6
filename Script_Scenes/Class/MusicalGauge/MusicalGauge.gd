class_name MusicalGauge
extends TextureProgressBar

@export var bpm : float
@export var progress : CompressedTexture2D

# Variables for beat and timer
var beat_duration : float
var timer : float = 0.0

# Variables for cursor
@onready var cursor : Area2D = $CursorArea
@onready var color_rect : ColorRect = $CursorArea/ColorRect
const GREEN : Color = Color(0.0, 0.517, 0.303, 0.784)
const RED : Color = Color(0.773, 0.0, 0.094, 0.784)

var list_blue_note : Array[Note]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Initialization of progress bar values
	max_value = 100.0
	min_value = 0.0
	value = 0.0
	# Beat duration in sec
	beat_duration = 60.0/bpm if bpm != 0.0 else 1.0
	
	texture_progress = progress
	color_rect.color = RED
	
	for note in get_children():
		if note is Note:
			list_blue_note.append(note)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer += delta
	
	# Timer restarts to 0.0 once the beat_duration is finished
	if timer >= beat_duration:
		timer = 0.0
	
	# Fills the progress bar
	value = (timer / beat_duration) * 100.0

	# Moves the cursor at the edge of the progress bar
	var percentage : float = value / max_value
	var bar_width : float = size.x
	cursor.position.x = bar_width * percentage


func _on_cursor_area_area_entered(area: Area2D) -> void:
	if area != null && area.is_in_group("Note"):
		color_rect.color = GREEN


func _on_cursor_area_area_exited(area: Area2D) -> void:
	if area != null && area.is_in_group("Note"):
		color_rect.color = RED


func _on_changing_levels_change_note_behaviour() -> void:
	for note in list_blue_note:
		note._setCanMove(true)
