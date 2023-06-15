extends TileMap


var mirar_cartell=false
signal cartell()


# Called when the node enters the scene tree for the first time.
func _ready():
	mirar_cartell=false


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
		if event.is_action_pressed("Pick"):
			Global.mirar_cart()
