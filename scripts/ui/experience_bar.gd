extends TextureProgress

var next_level_experience := 3.0
var current_level := 1


func _ready() -> void:
	Events.connect("star_added", self, "_on_Events_enemy_killed")
	max_value = next_level_experience


func _on_Events_enemy_killed():
	value += 1
	if value >= max_value:
		value = 0
		next_level_experience *= 1.1
		max_value = next_level_experience
		current_level += 1
		Events.emit_signal("level_upped", current_level)
	
