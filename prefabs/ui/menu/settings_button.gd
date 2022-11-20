extends Button

var settings_panel = preload("res://prefabs/ui/menu/settings.tscn")


func _on_SettingsButton_pressed():
	var i = settings_panel.instance()
	get_parent().get_parent().add_child(i)
	get_parent().queue_free()


func _ready() -> void:
	text = tr("SETTINGS_BUTTON")
