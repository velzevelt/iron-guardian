extends CanvasLayer

onready var _console = $Console


func _ready() -> void:
	if not OS.is_debug_build():
		hide()


func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_console"):
		_console.visible = !_console.visible
		if _console.visible:
			get_tree().paused = true
