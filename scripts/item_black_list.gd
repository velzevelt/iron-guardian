extends Node

var _items = []


func add_to_black_list(item):
	_items.append(item)

func erase_from_black_list(item):
	_items.erase(item)

func get_black_list():
	return _items
