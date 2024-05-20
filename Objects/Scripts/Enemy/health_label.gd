extends Label


func on_health_changed(new_health: float):
	text = "Health: " + str(new_health)
