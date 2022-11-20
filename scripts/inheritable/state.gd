extends Node
class_name State

#warning-ignore:unused_signal
signal finished(next_state_name)


func enter() -> void:
	pass

func exit() -> void:
	pass

func update(_delta) -> void:
	pass

func handle_input(_event) -> void:  # This cant handle mouse input
	pass
