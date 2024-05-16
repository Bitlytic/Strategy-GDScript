extends GPUParticles2D


var target : Node2D


func _ready():
	target = get_parent()
	finished.connect(on_finished)
	reparent(get_tree().root)


func _physics_process(delta: float) -> void:
	if target && is_instance_valid(target):
		global_position = target.global_position
	else:
		emitting = false


func on_finished():
	queue_free()
