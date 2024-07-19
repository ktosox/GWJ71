extends Node2D

 

@export var inserted_card : Item_Data

func _ready():
	if inserted_card != null:
		insert_card(inserted_card)

func take_out_card():
	GM.send_item_to_inventory(inserted_card)
	inserted_card = null
	$Polygon2D3.visible = false
	$HitBox.full = false
	pass

func insert_card(card : Item_Data):
	inserted_card = card
	$Polygon2D3.visible = true
	$Polygon2D3.color = card.color
	$HitBox.full = true

func _on_hit_box_gui_input(event : InputEvent):
	if event.is_action_pressed("LMB") and inserted_card != null:
		take_out_card()
	pass # Replace with function body.


func _on_hit_box_card_accepted(card : Item_Data):
	insert_card(card)
	if card.has_meta("ParentSlot"):
		card.get_meta("ParentSlot").empty_item_slot()
	pass # Replace with function body.
