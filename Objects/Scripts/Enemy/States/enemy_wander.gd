extends EnemyState


@export var min_wander_time := 2.5
@export var max_wander_time := 10.0
@export var wander_speed := 50.0

var wander_direction : Vector2

var wander_timer : Timer


# Upon moving to this state, initialize the 
# timer with a random duration.
func enter():
	wander_direction = Vector2.UP.rotated(deg_to_rad(randf_range(0, 360)))
	wander_timer = Timer.new()
	wander_timer.wait_time = randf_range(min_wander_time, max_wander_time)
	wander_timer.timeout.connect(on_timer_finished)
	wander_timer.autostart = true
	add_child(wander_timer)


func physics_process_state(delta: float):
	enemy.velocity = wander_direction*wander_speed
	enemy.move_and_slide()
	
	try_chase()


func on_timer_finished():
	transitioned.emit(self, "idle")


# When leaving this state (for any reason), stop timer,
# disconnect signals, and free timer
# Technically, just queue_free() would be required, but
# I like showcasing all of the options
func exit():
	wander_timer.stop()
	wander_timer.timeout.disconnect(on_timer_finished)
	wander_timer.queue_free()
	wander_timer = null
