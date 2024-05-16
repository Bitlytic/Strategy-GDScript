extends Area2D



func _ready() -> void:
	body_entered.connect(on_body_entered)


func on_body_entered(body: PhysicsBody2D):
	if body is Player:
		
