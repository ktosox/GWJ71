extends Node

var current_bar_scene : Node

var current_inventory : Node

func place_bar_button(button : Button):
	if is_instance_valid(current_bar_scene):
		current_bar_scene.add_child(button)
	pass

func send_item_to_inventory(item_data : Item_Data):
	if is_instance_valid(current_inventory):
		current_inventory.place_item(item_data)
	pass
