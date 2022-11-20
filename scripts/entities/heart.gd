extends Area2D

onready var player = Globals.player

export (PackedScene) var sfx = preload("res://prefabs/sfx/pickup_sfx.tscn")

func _on_Heart_body_entered(body):
	if body == player:
		player.call("heal",1)
		var a = sfx.instance()
		a.global_position = global_position
		Globals.world.add_child(a)
		queue_free()
