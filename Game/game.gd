extends Control

@onready var terminal = $TerminalWindow/Terminal

@onready var common_stuff = $TerminalWindow/Terminal.get_node("CommonStuff")

var inventory

func _enter_tree():
	GM.current_bar_scene = $MiniBar

func mount_sys_root():
	terminal.send_text("Mounting /sysroot ")
	common_stuff.play("three_dots")
	await common_stuff.animation_finished
	terminal.new_line()
	terminal.send_text("Mounted /sysroot.\n")
	
func mount_inventory():
	
	terminal.send_text("Mounting /inventory ")
	common_stuff.play("three_dots")
	await common_stuff.animation_finished
	terminal.new_line()
	terminal.send_text("Mounted /inventory.")
	inventory = load("res://window/inventory_window.tscn").instantiate()
	add_child(inventory)

	pass
