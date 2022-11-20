extends Enemy


func _ready() -> void:
	target = _find_target()


func _physics_process(delta) -> void:
	if not neib_is_close:
		rotation_dir = _get_normal_rotation()
	else:
		rotation_dir = _get_neib_rotation(neib)
	applied_rot += rotation_dir * delta
	rotation = lerp_angle(rotation, applied_rot, rotation_speed*delta*friction)
	if not sight:
		move_dir = get_global_transform().x.normalized()
		velocity += move_dir * delta * speed
	velocity = velocity.linear_interpolate(Vector2.ZERO, friction*delta)
	velocity = move_and_slide(velocity)


func _get_normal_rotation() -> int:
	var dir = get_angle_to(target.global_position)
	if dir>0: 
		rotation_dir = 1
	else:
		rotation_dir = -1
	if abs(rad2deg(dir)) < 5:
		rotation_dir = 0
	return rotation_dir


func _get_neib_rotation(var _neib) -> int:
	var dir = get_angle_to(_neib.global_position)
	if dir>0: 
		rotation_dir = -1
	else:
		rotation_dir = 1
	return rotation_dir

func take_damage(var damage := 1) -> void:
	health -= damage
	emit_signal("damage_taken",damage)
	if health <= 0:
		create_heart()
		create_star()
		Statistics.score += 1
		Statistics.killed_enemies += 1
		Events.emit_signal("enemy_killed", self)
		queue_free()



func _find_target():
	var targets = get_tree().get_nodes_in_group("ai_targets")
	var random_target = targets[randi() % targets.size()]
	return random_target


func _on_RayCast2D_target_in_sight():
	_fire()
	sight = true
	


func _on_RayCast2D_target_out_sight():
	sight = false


func _on_Neighbours_body_entered(body):
	if body != self:
		neib = body
		neib_is_close = true


func _on_Neighbours_body_exited(_body):
	neib_is_close = false


func _on_Timer_timeout():
	can_fire = true


func show_capture():
	aim.visible = true

func hide_capture():
	aim.visible = false
