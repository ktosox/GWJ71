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
	$ItemTexture.modulate = data.color
	pass

func empty_item_slot():
	$ItemTexture.texture = null
	item_data = null
	$ItemTexture.visible = false
	$ItemTexture.modulate = Color("white")
	pass

func _get_drag_data(at_position):
	if item_data == null:
		return
	var center = Control.new()
	
	var preview = item_preview_scene.instantiate() as TextureRect
	preview.modulate = item_data.color
	
	preview.texture = $ItemTexture.texture
	
	center.add_child(preview)
	preview.position = Vector2(-20,-20)
	set_drag_preview(center)

	item_data.set_meta("ParentSlot",self)

	return item_data
	pass

func _can_drop_data(at_position, data):
	if data.has_meta("Item_Data") and item_data == null :
		return true
	return false
	pass

func _drop_data(at_position, data):
	if data.has_meta("ParentSlot"):
		data.get_meta("ParentSlot").empty_item_slot()
	load_item_data(data)
	pass
