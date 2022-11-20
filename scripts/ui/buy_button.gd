extends Button



func _on_BuyButton_pressed() -> void:
	if is_instance_valid(ItemActions.current_item): 
		Globals.purchase(ItemActions.current_item.data.price)

	ItemActions.reset_data()
