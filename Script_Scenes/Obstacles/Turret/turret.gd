extends StaticBody2D

# Shoots bullets when the player is in range and red notes are reached

var target : CharacterBody2D
@onready var sprite : AnimatedSprite2D = $sprite

var bullet : PackedScene = preload("res://Script_Scenes/Obstacles/Turret/turret_bullet.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	MovementSignal.turret_atk_signal.connect(_on_turret_atk_signal)
	sprite.play("default")

# When the player is in range, the turrets aim for the player
func _on_area_detection_area_entered(area: Area2D) -> void:
	if area != null && area.is_in_group("PlayerHitbox"):
		target = area.get_parent()

# When the player is not in range anymore, the turrets are inactive
func _on_area_detection_area_exited(area: Area2D) -> void:
	if area != null && area.is_in_group("PlayerHitbox"):
		target = null

# Shoots a bullet on a signal towards the player if target is not null
func _on_turret_atk_signal() -> void:
	if target != null:
		var b = bullet.instantiate()
		b.global_position = global_position
		b._setDirection( (target.global_position - global_position).normalized() )
		get_tree().current_scene.add_child(b)
