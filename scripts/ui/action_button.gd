extends TextureButton

export var action_name := "mouse_left"

onready var anim := $AnimationPlayer as AnimationPlayer


func _gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch and event.is_pressed():
		Input.action_press(action_name)
		anim.play("animation")
