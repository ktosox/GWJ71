extends TextureRect

var special_offset = Vector2(10,10)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Window/RealPreview.texture = texture
	$Window/RealPreview.modulate = modulate
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Window.position = get_global_mouse_position() + special_offset
	pass
