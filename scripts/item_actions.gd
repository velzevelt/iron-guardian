extends Single

var current_action = null
var current_item = null

func reset_data():
	current_action = null
	current_item = null
	Events.emit_signal("item_reseted")


func init_current_action():
	if current_action:
		current_action.new()
	else:
		Logger.debug_log(current_item.data.name + " action is not found", MESSAGE_TYPE.ERROR)
