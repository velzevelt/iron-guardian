extends Button


func _on_ExitButton_pressed():
	if OS.has_feature('JavaScript'):
		JavaScript.eval("close()")
	get_tree().quit()


func _ready() -> void:
	text = tr("EXIT_BUTTON")
