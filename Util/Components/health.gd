class_name Health
extends Node

@export var hitbox : Hitbox

@export var max_health := 10.0
@onready var health := max_health


func _ready():
	if hitbox:
		hitbox.damaged.connect(on_damaged)


func on_damaged(attack: Attack):
	health -= attack.damage
	
	if health <= 0:
		health = 0
		get_owner().queue_free()
