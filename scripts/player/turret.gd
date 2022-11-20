extends KinematicBody2D


var turn_speed = deg2rad(90)
var target
var targets = []
var target_id := 0


func _ready() -> void:
	Events.connect("enemy_killed", self, "on_enemy_killed")


func _physics_process(delta: float) -> void:
	if is_instance_valid(target):
		var dir = get_angle_to(target.global_position)
		
		if abs(dir) > 0.04:
			if dir > 0: 
				rotation += turn_speed * delta
			else:
				rotation -= turn_speed * delta
	
	if Input.is_action_just_pressed("mouse_right"):
		change_target()

func _on_TargetCapture_body_entered(body: Node) -> void:
	if body.is_in_group("enemy"):
		targets.append(body)
		if target == null:
			target = targets[0]
			if target.has_method("show_capture"):
				target.call("show_capture")


func _on_TargetCapture_body_exited(body: Node) -> void:
	targets.erase(body)
	if body == target:
		target = null
	if body.has_method("hide_capture"):
		body.call("hide_capture")


func on_enemy_killed(enemy) -> void:
	if enemy in targets:
		targets.erase(enemy)
	if targets.size() > 0:
		target = targets[0]
		if target.has_method("show_capture"):
				target.call("show_capture")

func change_target() -> void:
	target_id += 1
	if target_id > targets.size() - 1:
		target_id = 0
	if targets.size() > 0:
		if is_instance_valid(target):
			target.call("hide_capture")
		target = targets[target_id]
		target.call("show_capture")
