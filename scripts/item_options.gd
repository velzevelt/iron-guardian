extends Single


var __default_options = {
	"heal_hq": 5,
	"increase_hp": 1,
	"increase_player_speed": 10,
	"increase_player_rotation": 0.25,
	"increase_turret_rotation": 5,
	"shop_slots": 4,
}


var _options = __default_options.duplicate()


func get_options():
	return _options


func get(key : String):
	if _options.has(key):
		return _options.get(key)
	else:
		Logger.debug_log(key + " not found in options", MESSAGE_TYPE.ERROR)


func set(key : String, value):
	if _options.has(key):
		
		_options[key] = value
		
	else:
		Logger.debug_log(key + " not found in options", MESSAGE_TYPE.ERROR)


func reset_data():
	_options = __default_options.duplicate()
