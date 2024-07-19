extends ColorRect


func _ready():
	GM.current_inventory = self

func place_item(item : Item_Data):
	var empty_slot = get_first_empty()
	
	empty_slot.load_item_data(item)

	pass


func get_first_empty():
	for slot in $Layout.get_children():
		if slot.item_data == null:
			return slot
