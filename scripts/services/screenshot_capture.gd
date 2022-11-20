extends Node2D


func take_screenshot():
	var img = get_viewport().get_texture().get_data()
	yield(get_tree(), "idle_frame")
	yield(get_tree(), "idle_frame")
	img.save_png("user://screenshot.png")
	Logger.debug_log("screenshot captured")


func _process(_delta):
	if Input.is_action_just_pressed("take_screenshot"):
		take_screenshot()
