extends GPUParticles2D


var target : Node2D


func _ready():
	# Here, we reparent the node to the root but store the parent as our follow target
	# We do this because if the parent gets freed, all of the particles disappear immediately.
	target = get_parent()
	finished.connect(on_finished)
	reparent(get_tree().root)


func _physics_process(delta: float) -> void:
	if target && is_instance_valid(target):
		global_position = target.global_position
	else:
		emitting = false


# Finished is called when all particles have disappeared
func on_finished():
	queue_free()
