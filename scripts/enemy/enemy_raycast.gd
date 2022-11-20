extends RayCast2D

onready var parent = get_parent().get_parent().get_parent() as Enemy

signal target_in_sight
signal target_out_sight
signal target_changed(target)

func _physics_process(_delta):
	if is_colliding():
		var intersection = get_collider()
		if intersection.is_in_group("ai_targets"):
			emit_signal("target_in_sight")
			if intersection != parent.target:
				parent.target = intersection
				emit_signal("target_changed", intersection)
	else:
		emit_signal("target_out_sight")
	
