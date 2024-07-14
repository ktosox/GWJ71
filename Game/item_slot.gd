extends ColorRect

@export var item_data : Item_Data

var item_preview_scene

func _ready():
	if item_data != null :
		load_item_data(item_data)

func load_item_data(data : Item_Data):
	item_data = data
	$ItemTexture.texture = load(data.texture_path)
	
	pass

func empty_item_slot():
	$ItemTexture.texture = null
	item_data = null
	pass

func _get_drag_data(at_position):

	pass

func _can_drop_data(at_position, data):
	if data.is_class("Item_Data") and item_data == null :
		return true
	return false
	pass

func _drop_data(at_position, data):
	load_item_data(data)
	pass
