extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var new_item = Item_Data.new()
	new_item.name = "derp"
	var test_textures = [load("res://resources/textures/dodo.png"),load("res://resources/textures/cardboard-box.png"),load("res://resources/textures/id-card.png"),load("res://resources/textures/test-tube-rack.png")]
	new_item.texture = test_textures[randi()%test_textures.size()]
	
	$Inventory.place_item(new_item)
	pass # Replace with function body.
