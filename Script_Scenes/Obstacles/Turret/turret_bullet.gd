extends Sprite2D

const SPEED : float = 50.0
var direction : Vector2

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position += direction * SPEED * delta
	rotation_degrees += delta * SPEED
	
func _setDirection(body : Vector2) -> void:
	direction = body

func _on_hurtbox_area_entered(area: Area2D) -> void:
	if area != null && area.is_in_group("PlayerHitbox"):
		GameOverSignal.game_over_signal.emit()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
