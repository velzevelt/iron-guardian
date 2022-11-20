extends Node


func set_music_volume(value : float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)


func set_sfx_volume(value : float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), value)
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Engine"), value)

