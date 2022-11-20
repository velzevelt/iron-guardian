extends Node

signal message_entered(message)

var _string_id : int = 1

onready var _duplicate_output_to_godot = ProjectSettings.get("application/config/duplicate_logger_output_to_debugger")


func _format_output(var value : String, var format_pattern = ": ") -> String:
	value = str(_string_id) + format_pattern + value
	return value


func _format_warning(var value : String) -> String:
	value = "[color=yellow]" + value + "[/color]"
	return value


func _format_error(var value : String) -> String:
	value = "[color=red]" + value + "[/color]"
	return value


func debug_log(var value, var message_type = MESSAGE_TYPE.REGULAR) -> void:
	if not typeof(value) == TYPE_STRING:
		value = str(value)
	
	var console_output = _format_output(value)
	
	match message_type:
		MESSAGE_TYPE.WARNING:
			console_output = _format_warning(console_output)
		MESSAGE_TYPE.ERROR:
			console_output = _format_error(console_output)
	
	if _duplicate_output_to_godot:
		_print_to_godot(value, message_type)
	
	emit_signal("message_entered", console_output)
	_string_id += 1


func _print_to_godot(var value, var message_type):
	var debugger_output = _format_output(value)
	
	match message_type:
		MESSAGE_TYPE.WARNING:
			push_warning(debugger_output)
		MESSAGE_TYPE.ERROR:
			push_error(debugger_output)
	
	print(debugger_output)
