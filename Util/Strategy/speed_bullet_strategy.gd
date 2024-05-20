class_name SpeedBulletStrategy
extends BaseBulletStrategy


@export var speed_increase := 50.0


func apply_upgrade(bullet: Bullet):
	bullet.speed += speed_increase
