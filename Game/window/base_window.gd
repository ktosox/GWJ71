extends Window

var bar_button_scene = preload("res://window/bar_button.tscn")



func _ready():
	create_bar_item()
	pass


func create_bar_item():
	var new_bar_button = bar_button_scene.instantiate()
	new_bar_button.connect("pressed",Callable(self,"re_open"))
	new_bar_button.text = get_child(0).name
	GM.place_bar_button(new_bar_button)
	pass

func re_open():
	visible = true
	pass

func _on_close_requested():
	visible = false
	pass # Replace with function body.
