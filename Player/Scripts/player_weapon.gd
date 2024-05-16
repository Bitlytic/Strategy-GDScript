extends Node2D


@export var firing_position : Marker2D

var bullet_scene : PackedScene = preload("res://Objects/Scenes/bullet.tscn")


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("primary_fire"):
		print("Firing1")
		
		var spawned_bullet := bullet_scene.instantiate()
		
		var mouse_direction := get_global_mouse_position() - firing_position.global_position
		
		get_tree().root.add_child(spawned_bullet)
		spawned_bullet.global_position = firing_position.global_position
		spawned_bullet.rotation = mouse_direction.angle()
		
