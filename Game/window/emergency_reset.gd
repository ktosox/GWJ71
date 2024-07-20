extends ColorRect

signal reset_completed

var reset_ongoing = false

var reset_progress = 0.0

var success = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if reset_ongoing and !success:
		reset_progress += delta * 1.2
		if reset_progress > 4.0 :
			success = true
			
			$AnimationPlayer.play("new_animation")
	$ResetLights.value = int(reset_progress)
	pass


func _on_button_button_down():
	reset_ongoing = true
	pass # Replace with function body.


func _on_button_button_up():
	reset_ongoing = false
	reset_progress = 0.0
	$AnimationPlayer.stop()
	if success:
		emit_signal("reset_completed")
		print("bip")
		success = false
	pass # Replace with function body.
