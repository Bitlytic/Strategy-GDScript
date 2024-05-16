extends Area2D

@export var bullet_strategy : BaseBulletStrategy
@onready var sprite := $Sprite2D


func _ready() -> void:
	body_entered.connect(on_body_entered)
	sprite.texture = bullet_strategy.texture


func on_body_entered(body: PhysicsBody2D):
	if body is Player:
		body.upgrades.append(bullet_strategy)
		
		queue_free()
