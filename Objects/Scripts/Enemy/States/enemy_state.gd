class_name EnemyState
extends Node


#####################################
# This is the base enemy state
# Each state will inherit from this
#####################################

signal transitioned(state: EnemyState, new_state_name: String)

@onready var enemy : Enemy = get_owner()
var player : Player


func _ready():
	player = get_tree().get_first_node_in_group("player")
	enemy.damaged.connect(on_damaged)


# This is called directly when transitioning to this state
# Useful for setting up the state to be used
# In Idle, we use this function to decide how long we will idle for
func enter():
	pass


# When the state is active, this is essentially the _process() function
func process_state(delta: float):
	pass


# When the state is active, this is essentially the _physics_process() function
func physics_process_state(delta: float):
	pass


# Useful for cleaning up the state
# For example, clearing any timers, disconnecting any signals, etc.
func exit():
	pass


###############################################
# Non FSM-specific methods. These are utility 
# methods that may be used by multiple states. 
###############################################

# Attempts to switch to chase state if it detects the player
func try_chase() -> bool:
	if get_distance_to_player() <= enemy.detection_radius:
		transitioned.emit(self, "chase")
		return true
	
	return false


func get_distance_to_player() -> float:
	return player.global_position.distance_to(enemy.global_position)


# If you wanted to replace this functionality in a state you can either:
# 1. Disconnect the signal by doing enemy.damaged.disconnect(on_damaged)
# 2. Override the on_damaged() function to do nothing
# 3. Override the _ready() function
# This is the order I would recommend personally
func on_damaged(attack: Attack):
	transitioned.emit(self, "stun")
