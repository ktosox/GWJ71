extends Control

@onready var terminal = $TerminalWindow/Terminal

@onready var common_stuff = $TerminalWindow/Terminal.get_node("CommonStuff")

var hard_reset_complete = false

func _enter_tree():
	GM.current_bar_scene = $MiniBar

func _ready():
	$TerminalWindow.create_bar_item()

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
	terminal.send_text("Mounted /inventory.\n")
	$InventoryWindow.visible = true
	$InventoryWindow.create_bar_item()

	pass

func system_diagnostic():
	terminal.send_text("Attempting full system diagnostic ")
	common_stuff.play("three_dots")
	await common_stuff.animation_finished
	common_stuff.play("three_dots")
	await common_stuff.animation_finished
	terminal.new_line()
	terminal.send_text("Diagnostic failed with emergency code: 74B - main power supply offline.\n")
	terminal.send_text("Critical system error detected, press enter to activate recovery mode.\n")
	terminal.wait_state = true
	await terminal.key_pressed
	$Intro.play("boot OS")
	pass

func boot_os():
	terminal.send_text("Booting backup OS ")
	common_stuff.play("three_dots")
	await common_stuff.animation_finished
	terminal.new_line()
	terminal.send_text("Booted backup OS.\n")
	terminal.new_line()
	terminal.send_text("Welcome to lastHope OS 2.15 (Pepperoni)\n\n")
	
func power_check():
	terminal.send_text("\nPower check ")
	common_stuff.play("three_dots")
	await common_stuff.animation_finished
	terminal.new_line()
	terminal.send_text("Main power - offline / no data.\nBack-up Generator - offline / access denied.\nEmergency battery - active.\n")
	pass

func try_hard_reset():
	terminal.send_text("Attempting remote reset of Back-up Generator ")
	common_stuff.play("three_dots")
	await common_stuff.animation_finished
	terminal.new_line()
	terminal.send_text("Reset failed : access denied\n")
	terminal.send_text("Booting remote reset terminal ")
	common_stuff.play("three_dots")
	await common_stuff.animation_finished
	terminal.new_line()
	$EmergencyResetWindow.visible = true
	$EmergencyResetWindow.create_bar_item()
	terminal.send_text("Booted remote reset terminal.\n")
	
	pass

func request_hard_reset():
	terminal.send_text("Press and hold the reset button on the RR terminal for about 5 seconds until the lights flash. Then release the button and pull out the access card to complete the hard reset.\n")
	terminal.wait_state = true
	await terminal.key_pressed
	while hard_reset_complete == false:
		terminal.send_text("Please complete the hard reset before continuing.\n")
		terminal.set_deferred("wait_state",true)
		await terminal.key_pressed
	pass


func _on_emergency_reset_reset_completed():
	hard_reset_complete = true
	pass # Replace with function body.


func _on_card_slot_card_removed():
	if hard_reset_complete:
		print("go to next section")
	pass # Replace with function body.


