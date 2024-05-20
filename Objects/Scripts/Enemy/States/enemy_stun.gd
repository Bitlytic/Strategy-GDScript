extends EnemyState


var timer : Timer


# Upon moving to this state, initialize timer
# and stun enemy
func enter():
	timer = Timer.new()
	timer.wait_time = 1.0
	timer.autostart = true
	timer.timeout.connect(on_timer_finished)
	add_child(timer)
	enemy.stunned = true


# Upon leaving this state, clear and free all
# state relevant stuff
func exit():
	timer.stop()
	timer.timeout.disconnect(on_timer_finished)
	timer.queue_free()
	timer = null
	enemy.stunned = false


func on_timer_finished():
	if !try_chase():
		transitioned.emit(self, "chase")
