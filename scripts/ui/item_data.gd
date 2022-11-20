extends Resource
class_name ItemData

export (Texture) var icon = preload("res://sprites/ui/no_icon.png")
export (String)  var name  setget , get_name
export (String)  var description = "description" setget , get_description
export (int) var price setget set_price, get_price
export (bool) var unique := false
export (bool) var one_shot := true

export (Script) var action

### OPTIONAL ###
export (Array, String) var formatted_keys = []



func set_price(value):
	price = value


func get_price():
	return price
	


func get_name():
	return tr(name)


func get_description():
	if formatted_keys == []:
		return tr(description)
	
	var format_string = tr(description)
	
	var dictionary = ItemOptions.get_options() 
	var formatted_ar = []
	
	for key in formatted_keys:
		if dictionary.has(key):
			formatted_ar.append(dictionary.get(key))
	
	var actual_string = format_string % formatted_ar
	return actual_string
