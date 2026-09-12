extends Label

@onready var score_label : Label = $score_label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_movement_signal()
	MovementSignal.movement_signal.connect(_on_movement_signal)

func _on_movement_signal() -> void:
	score_label.text = str(MovementSignal._getCpt())
