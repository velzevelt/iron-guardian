extends TextureButton


func _on_ExitButton_pressed():
	Globals.change_scene(Globals.menu)
	get_tree().paused = false
