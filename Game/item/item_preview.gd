extends TextureRect


# Called when the node enters the scene tree for the first time.
func _ready():
	$Window/RealPreview.texture = texture
	$Window/RealPreview.modulate = modulate
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Window.position = get_global_mouse_position() + Vector2(55,55)
	pass