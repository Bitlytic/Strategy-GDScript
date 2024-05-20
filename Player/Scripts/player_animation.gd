extends Node

##################################################
# Similar to the movement component. The actual 
# animations are handled through an AnimationTree 
# for the player, but parameters are updated here.
##################################################

@export var animation_tree : AnimationTree
@export var sprite : Sprite2D

@onready var player : Player = get_owner()


func _ready():
	# The animation tree is inactive while outside of gameplay.
	# This makes it easier to edit animations in the editor.
	animation_tree.active = true


func _physics_process(delta: float) -> void:
	var velocity = player.velocity
	
	if velocity:
		var time_scale = 1
		
		if sign(player.aim_position.x) != sign(player.velocity.x):
			time_scale = -1
		
		animation_tree.set("parameters/TimeScale/scale", time_scale)
		animation_tree.set("parameters/WalkDirection/blend_position", sign(player.aim_position.x))
	else:
		sprite.flip_h = player.aim_position.x < 0
		animation_tree.set("parameters/TimeScale/scale", 1)
		animation_tree.set("parameters/WalkDirection/blend_position", 0)
	
