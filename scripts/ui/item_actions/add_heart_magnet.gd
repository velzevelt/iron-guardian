extends Node

var heart_magnet = preload("res://scripts/player/modificators/heart_magnet/heart_magnet.tscn").instance()

func _init() -> void:
	if Globals.modificators:
		Globals.modificators.add(heart_magnet)
