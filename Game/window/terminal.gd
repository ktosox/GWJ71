extends Control

# requirements

# enter an "accept enter / key input" state when prompted

# print text on screen
@export var wait_state = false

signal key_pressed

func _ready():

	pass

func _input(event):
	if wait_state:
		if event.is_class("InputEventKey") and event.is_pressed() :
			emit_signal("key_pressed")
			wait_state = false
			print("key_pressed")
			pass


func send_text(text : String):
	$Text.add_text(text)
	pass

func new_line():
	$Text.add_text('\n')
	pass

func clear_text():
	$Text.clear()
	pass
