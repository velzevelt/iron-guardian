extends Node


func _init() -> void:
	if Globals.hq:
		Globals.hq.heal(ItemOptions.get("heal_hq"))
