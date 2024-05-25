class_name ParticleBulletStrategy
extends BaseBulletStrategy

var particle_scene : PackedScene = preload("res://Objects/Scenes/bullet_particles.tscn")

func apply_upgrade(bullet: Bullet):
	var spawned_particles : Node2D = particle_scene.instantiate()
	bullet.add_child(spawned_particles)
	spawned_particles.global_position = bullet.global_position
