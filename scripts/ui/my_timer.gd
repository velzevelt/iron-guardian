extends Label

class MyTime :
	var seconds = 0 setget set_seconds, get_seconds
	
	func set_seconds(value):
		if seconds >= 59:
			seconds = 0
			set_minutes(1)
		seconds += value
	
	func get_seconds():
		return str(round(seconds))
	
	
	var minutes = 0 setget set_minutes, get_minutes
	
	func set_minutes(increment):
		minutes += increment
		if minutes % 2 == 0:
			Events.emit_signal("difficulty_increased")
	
	func get_minutes():
		return str(minutes)
	

var time

func _ready() -> void:
	time = MyTime.new()

func _physics_process(delta: float) -> void:
	time.set_seconds(delta)
	text = time.get_minutes() + ":" + time.get_seconds()
