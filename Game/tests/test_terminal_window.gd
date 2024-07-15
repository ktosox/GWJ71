extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	for animation in $TerminalWindow.get_node("CommonStuff").get_animation_list():
		print(animation)
		$OptionButton.add_item(animation)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_line_edit_text_submitted(new_text):
	$TerminalWindow.send_text(new_text)
	pass # Replace with function body.


func _on_button_pressed():
	$TerminalWindow.new_line()
	pass # Replace with function body.


func _on_button_2_pressed():
	$TerminalWindow.clear_text()
	pass # Replace with function body.


func _on_option_button_item_selected(index):
	print($OptionButton.get_item_text(index))
	$TerminalWindow.get_node("CommonStuff").play($OptionButton.get_item_text(index))
	pass # Replace with function body.
