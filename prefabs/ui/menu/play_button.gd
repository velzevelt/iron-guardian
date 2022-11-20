extends Button


func _on_PlayButton_pressed():
	Globals.change_scene(Globals.game)


func _ready() -> void:
	text = tr("PLAY_BUTTON")
