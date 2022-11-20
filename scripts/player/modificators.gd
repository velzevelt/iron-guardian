extends Node2D


func _ready() -> void:
	Globals.modificators = self

func add(object) -> void:
	add_child(object)
