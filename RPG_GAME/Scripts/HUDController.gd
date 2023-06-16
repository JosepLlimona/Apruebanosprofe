class_name HudController extends CanvasLayer

var heartImage = preload("res://Tiny Adventure Pack Plus/Other/Items/Misc/Heart.png")
var hearts:= []

var xPos = 3
var yPos = 3

func startGame(life:int):
	for i in life:
		addHeart()

func addHeart():
	var texture = TextureRect.new()
	texture.texture = heartImage
	texture.rect_scale = Vector2(5,5)
	texture.rect_position = Vector2(xPos,yPos)
	hearts.append(texture)
	add_child(texture)
	xPos += 40

func removeHeart():
	if !hearts.empty():
		hearts.pop_back().queue_free()
		xPos -= 40

func _unhandled_input(event:InputEvent) -> void:
	if event is InputEventMouseButton and $Area2D.dintre:
		if event.button_index == BUTTON_LEFT and event.pressed:
			$Area2D.hide()
			get_tree().set_input_as_handled()  # evitem que es propagui més l'input 

func show_text(text):
	$Area2D.show()
	$Area2D.posar_text(text)

func hide_text():
	$Area2D.hide()
