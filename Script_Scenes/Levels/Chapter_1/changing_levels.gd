extends Node2D

signal change_note_behaviour

var current_lvl : int = 1

@export var camera : Camera2D
@onready var area_lvl : Area2D = $Area_Lvl
var viewport_x : float

@onready var separation_lvl : StaticBody2D = $"../Box_Collision/Separation_Lvl"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewport_x = get_viewport_rect().size.x

# When the player completes a level, moves the camera and the area that detects if the player has succeeded
func _on_area_lvl_body_entered(body: Node2D) -> void:
	if body != null && body.is_in_group("Player"):
		camera.position.x += viewport_x
		area_lvl.position.x += viewport_x
		
		# Prevents the player from going in a previous level
		separation_lvl._activate_collision(current_lvl - 1)
		current_lvl += 1
		
		if current_lvl == 4:
			change_note_behaviour.emit()


func _on_changing_chapter_body_entered(body: Node2D) -> void:
	if body != null && body.is_in_group("Player"):
		TransitionEffects.transition_black_circle()
		await TransitionEffects.on_transition_finished
	
		get_tree().change_scene_to_file("res://Script_Scenes/Levels/Chapter_2/chapter_2.tscn")
