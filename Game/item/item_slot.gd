extends ColorRect

@export var item_data : Item_Data

var item_preview_scene = preload("res://item/item_preview.tscn")

func _ready():
	if item_data != null :
		load_item_data(item_data)

func load_item_data(data : Item_Data):
	item_data = data
	$ItemTexture.texture = data.texture
	$ItemTexture.visible = true
	pass

func empty_item_slot():
	$ItemTexture.texture = null
	item_data = null
	$ItemTexture.visible = false
	pass

func _get_drag_data(at_position):
	var center = Control.new()
	var preview = item_preview_scene.instantiate() as TextureRect
	
	
	preview.texture = $ItemTexture.texture
	
	center.add_child(preview)
	preview.position = Vector2(-20,-20)
	set_drag_preview(center)

	return item_data
	pass

func _can_drop_data(at_position, data):
	if data.is_class("Item_Data") and item_data == null :
		return true
	return false
	pass

func _drop_data(at_position, data):
	load_item_data(data)
	pass
