extends Node


func _init() -> void:
	ItemOptions.set("shop_slots", ItemOptions.get("shop_slots") + 1)
