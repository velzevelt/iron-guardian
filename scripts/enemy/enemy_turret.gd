extends KinematicBody2D

var turn_speed = deg2rad(90)
onready var parent = get_parent()
var target

func _ready():
	yield(parent,"ready")
	target = parent.target

func _process(delta):
	var dir = get_angle_to(target.global_position)
	
	if abs(dir) > 0.04:
			if dir > 0: 
				rotation += turn_speed * delta
			else:
				rotation -= turn_speed * delta
	


func _on_RayCast2D_target_changed(_target):
	target = _target
