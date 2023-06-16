extends TileMap


var mirar_cartell=false
var cart_visible=false
signal cartell()


# Called when the node enters the scene tree for the first time.
func _ready():
	mirar_cartell=false
	cart_visible=false


func _on_Area2D_body_entered(body):
	if(body.get_name()=="Player"):
		Global.surt_instancia()


func _on_cartells_body_entered(body):
	if(body.get_name()=="Player"):
		mirar_cartell=true


func _on_cartells_body_exited(body):
	if(body.get_name()=="Player"):
		mirar_cartell=false

func _unhandled_input(event:InputEvent) -> void:
	if mirar_cartell:
		if event.is_action_pressed("Pick") and cart_visible==false:
			Global.mirar_cart()
			cart_visible=true
		elif event.is_action_pressed("Pick") and cart_visible==true:
			cart_visible=false
			Global.amaga_cart()
	else:
		if event.is_action_pressed("Pick") and cart_visible==true:
			cart_visible=false
			Global.amaga_cart()
