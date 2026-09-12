extends StaticBody2D

var list_collision : Array[CollisionShape2D]
var len_list_collision : int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Add in a Array of CollisionShape2D all the collisions of the body
	for collision : CollisionShape2D in get_children():
		collision.disabled = true
		list_collision.append(collision)
		
	# Calculates the length of list_collision
	len_list_collision = len(list_collision)
	
# Activate the CollisionShape2D at list_collision[idx]. Returns true if the idx is valid, false otherwise
func _activate_collision(idx : int) -> bool:
	if idx < len_list_collision && idx >= 0:
		list_collision[idx].set_deferred("disabled", false)
		return true
		
	return false
