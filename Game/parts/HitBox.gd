extends Control

signal card_accepted(card:Item_Data)

@export var full = false

# note to self - I should probably turn the root into HitBox to avoid this huge spaghett

func _can_drop_data(at_position, data):
	if data.has_meta("Item_Data") and !full:
		if data.is_card:
			return true
	return false
	pass

func _drop_data(at_position, data):
	emit_signal("card_accepted",data)
	pass
