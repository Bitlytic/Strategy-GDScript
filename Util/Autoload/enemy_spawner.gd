extends Node2D

################################################
# This is an autoloaded node that allows you
# to spawn an enemy when pressing "E" by default
################################################


var enemy_scene : PackedScene = preload("res://Objects/Scenes/enemy.tscn")


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("spawn_enemy"):
		var spawned_enemy : Enemy = enemy_scene.instantiate()
		get_tree().root.add_child(spawned_enemy)
		spawned_enemy.global_position = get_global_mouse_position()
