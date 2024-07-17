extends Control

var terminal : Control

# Called when the node enters the scene tree for the first time.
func _ready():
	GM.current_bar_scene = $HBoxContainer
	var terminal_window = load("res://window/terminal_window.tscn").instantiate() as Window
	add_child(terminal_window)
	terminal = terminal_window.get_child(0)
	for animation in terminal.get_node("CommonStuff").get_animation_list():
		print(animation)
		$OptionButton.add_item(animation)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_line_edit_text_submitted(new_text):
	terminal.send_text(new_text)
	pass # Replace with function body.


func _on_button_pressed():
	terminal.new_line()
	pass # Replace with function body.


func _on_button_2_pressed():
	terminal.clear_text()
	pass # Replace with function body.


func _on_option_button_item_selected(index):
	print($OptionButton.get_item_text(index))
	terminal.get_node("CommonStuff").play($OptionButton.get_item_text(index))
	pass # Replace with function body.
