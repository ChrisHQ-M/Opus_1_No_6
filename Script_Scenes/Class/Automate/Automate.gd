class_name Automate
extends Node

@export var initial_node_state : State

var set_states : Dictionary = {}
var current_state : State
var current_state_str : String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for child in get_children():
		if child is State:
			set_states[child.name.to_lower()] = child
			child.transition.connect(transition_to)
			
	if initial_node_state != null:
		initial_node_state._on_enter()
		current_state = initial_node_state


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if current_state != null:
		current_state._on_process(delta)
		
func _physics_process(delta: float) -> void:
	if current_state != null:
		current_state._on_physics_process(delta)
		current_state._on_next_transitions()
		
func transition_to(state_str : String) -> void:
	#transition de S vers S
	if state_str == current_state.name.to_lower():
		return
		
	var new_state = set_states.get(state_str.to_lower())

	if new_state == null:
		return
		
	if current_state != null:
		current_state._on_exit()
		
	new_state._on_enter()
	
	current_state = new_state
	current_state_str = new_state.name.to_lower()
