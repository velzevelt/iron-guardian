extends RigidBody2D

export var damage := 1

var explosion = preload("res://prefabs/effects/explosion.tscn")
var lord


func _on_Bullet_body_entered(body):
	if body != lord:
		var explosion_instance = explosion.instance()
		explosion_instance.position = get_global_position()
		Globals.world.add_child(explosion_instance)
		if body.has_method("take_damage"):
			body.call("take_damage", damage)
		queue_free()

func _on_Timer_timeout():
	queue_free()
