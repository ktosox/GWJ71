extends Node

var current_bar_scene : Node

func place_bar_button(button : Button):
	assert(is_instance_valid(current_bar_scene))
	current_bar_scene.add_child(button)
	pass
