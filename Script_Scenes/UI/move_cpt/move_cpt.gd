extends Label

@onready var score_label : Label = $score_label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_on_game_over_signal()
	GameOverSignal.game_over_signal.connect(_on_game_over_signal)

func _on_game_over_signal() -> void:
	score_label.text = str(GameOverSignal.getNbTry())
