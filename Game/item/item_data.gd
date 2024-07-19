extends Resource

class_name Item_Data

@export var name : String

@export var texture : Texture

@export var is_card = false

@export var color = Color("white")

func _init():
	set_meta("Item_Data",1)

