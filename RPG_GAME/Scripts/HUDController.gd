class_name HudController extends CanvasLayer

var heartImage = preload("res://Tiny Adventure Pack Plus/Other/Items/Misc/Heart.png")
var hearts:= []

var xPos = 3
var yPos = 3

func startGame(life:int):
	for i in life:
		addHeart(xPos,yPos)


func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		removeHeart()
	elif Input.is_action_just_pressed("ui_cancel"):
		addHeart(xPos,yPos)

func addHeart(x,y):
	var texture = TextureRect.new()
	texture.texture = heartImage
	texture.rect_scale = Vector2(5,5)
	texture.rect_position = Vector2(x,y)
	hearts.append(texture)
	add_child(texture)
	xPos += 40

func removeHeart():
	if !hearts.empty():
		hearts.pop_back().queue_free()
		xPos -= 40
