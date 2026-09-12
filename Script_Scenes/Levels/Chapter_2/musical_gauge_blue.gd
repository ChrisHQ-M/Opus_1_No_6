extends MusicalGauge

@onready var blue_note_middle : Note = $blue_note3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()
	blue_note_middle._setCanMove(true)
	
