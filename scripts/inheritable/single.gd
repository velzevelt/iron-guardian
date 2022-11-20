extends Node
class_name Single


func _ready() -> void:
	Events.connect("scene_changed", self, "reset_data")


func reset_data() -> void:
	pass
