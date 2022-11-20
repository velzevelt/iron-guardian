extends RayCast2D


signal neighbor_is_close
signal neighbor_is_out


func _physics_process(_delta):
	if is_colliding():
		emit_signal("neighbor_is_close")
	else:
		emit_signal("neighbor_is_out")
