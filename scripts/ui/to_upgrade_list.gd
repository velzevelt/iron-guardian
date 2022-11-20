extends GridContainer

export (PackedScene) var item_node
export (Array, Resource) var items_data

var _items_amount := 0

var _black_list = []

func _ready() -> void:
	
	_items_amount = ItemOptions.get("shop_slots")
	
	add_item(0) # HEAL HQ ALWAYS available
	add_random_items()


func add_item(id):
	create_item(items_data[id])


func create_item(item_data):
	var i = item_node.instance()
	
	while item_data in ItemBlackList.get_black_list() or item_data in _black_list:
		item_data = get_random_data()
	
	if item_data.unique:
		_black_list.append(item_data)
	
	i.data = item_data
	add_child(i)


func add_random_items():
	for _b in range(1, _items_amount):
		var item_data = get_random_data()
		create_item(item_data)


func get_random_data():
	var size = items_data.size() - 1
	return items_data[randi() % size + 1]
