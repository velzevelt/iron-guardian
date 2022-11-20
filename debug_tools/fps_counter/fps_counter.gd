extends Label


func _process(_delta) -> void:
	text = str(Engine.get_frames_per_second())


func _ready() -> void:
	if not OS.is_debug_build():
		queue_free()
	
	Events.connect("fps_counter_toggled", self, "_toggle_visibility")

func _toggle_visibility() -> void:
	visible = !visible
