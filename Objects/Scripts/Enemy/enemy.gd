class_name Enemy
extends CharacterBody2D

#########################################################
# I tend to keep the top level node's functionality 
# small. Here, this node is responsible for common state
# variables, passing the damaged signal around, and 
# picking a random texture on spawn.
#
# For the most part, other functionality that controls
# the enemy is handled by specific states.
#
# ex. Movement is handled by states setting velocity
# and calling move_and_slide()
########################################################


signal damaged(attack: Attack)

@export_group("Textures")
@export var textures: Array[Texture2D] = []

@export_group("Vision Ranges")
@export var detection_radius := 100.0
@export var chase_radius := 200.0
# This guy doesn't actually attack, he just tries to get close to the player
@export var follow_radius := 25.0

@onready var sprite : Sprite2D = $Sprite2D

var alive := true
var stunned := false


func _ready():
	sprite.texture = textures.pick_random()


func on_damaged(attack: Attack) -> void:
	damaged.emit(attack)
