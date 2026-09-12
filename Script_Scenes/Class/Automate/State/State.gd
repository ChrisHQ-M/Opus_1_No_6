class_name State
extends Node

@warning_ignore("unused_signal")
signal transition

@export var inst : CharacterBody2D
@export var animation : AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _on_process(_delta: float) -> void:
	pass
	
func _on_physics_process(_delta: float) -> void:
	pass
	
func _on_next_transitions() -> void:
	pass
	
func _on_enter() -> void:
	pass
	
func _on_exit() -> void:
	pass
