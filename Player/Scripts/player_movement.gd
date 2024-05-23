extends Node

##########################################################
# This is the player's movement controller.
# Instead of placing all of the movement stuff inside
# of the player, we move the code to a separate component
##########################################################

@export_group("Speed Values")
@export var max_speed := 100.0
@export var acceleration_time := 0.1

@onready var player : CharacterBody2D = get_owner()


func _physics_process(delta):
	# Read the player's current velocity
	var velocity = player.velocity
	
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	# Apply any changes to velocity
	velocity = velocity.move_toward(input_direction*max_speed, (1.0 / acceleration_time) * delta * max_speed)
	
	if input_direction.y && sign(input_direction.y) != sign(velocity.y):
		velocity.y *= 0.75 
	
	if input_direction.x && sign(input_direction.x) != sign(velocity.x):
		velocity.x *= 0.75
	
	# Reassign velocity and move the player
	player.velocity = velocity
	player.move_and_slide()
