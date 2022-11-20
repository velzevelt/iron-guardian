extends HBoxContainer

export (Resource) var data 

onready var sprite = $Button/HBoxContainer/TextureRect
onready var label = $Button/HBoxContainer/Label


func _ready() -> void:
	if data:
		label.text = data.name
		sprite.texture = data.icon
	else:
		Logger.debug_log("data not found", MESSAGE_TYPE.ERROR)
	Events.connect("item_bought", self, "_on_item_bought")


func _on_Button_pressed() -> void:
	ItemActions.current_action = data.action
	ItemActions.current_item = self
	Events.emit_signal("item_selected", data)


func _on_item_bought(item):
	if item == self:
		if item.data.unique:
			ItemBlackList.add_to_black_list(item.data)
		
		if item.data.one_shot:
			item.queue_free()
		
