extends Node

var star_magnet = preload("res://scripts/player/modificators/star_magnet/star_magnet.tscn").instance()


func _init():
	if Globals.modificators:
		Globals.modificators.add(star_magnet)
