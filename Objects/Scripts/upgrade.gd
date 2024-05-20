####################################################
# Tools are sick. The code in this script is treated
# nearly the same as if the game is running. The one
# difference is we can do Engine.is_editor_hint() to
# find out if we're currently in the editor
# Docs: https://docs.godotengine.org/en/stable/tutorials/plugins/running_code_in_the_editor.html#how-to-use-tool
####################################################
@tool
extends Area2D

@export var upgrade_label : Label
@export var sprite : Sprite2D
@export var bullet_strategy : BaseBulletStrategy:
	set(val):
		bullet_strategy = val
		needs_update = true

# Used when editing to denote that the sprite has changed and needs updating
@export var needs_update := false


func _ready() -> void:
	body_entered.connect(on_body_entered)
	sprite.texture = bullet_strategy.texture
	upgrade_label.text = bullet_strategy.upgrade_text


func _process(delta: float) -> void:
	
	# This is run only when we're editing the scene
	# It updates the texture of the sprite when we replace the upgrade strategy
	if Engine.is_editor_hint():
		if needs_update:
			sprite.texture = bullet_strategy.texture
			upgrade_label.text = bullet_strategy.upgrade_text
			needs_update = false


func on_body_entered(body: PhysicsBody2D):
	if body is Player:
		######################################
		# Strategy Relevant Code:
		# This adds the upgrade to our player,
		# which the player uses when firing.
		######################################
		body.upgrades.append(bullet_strategy)
		
		queue_free()
