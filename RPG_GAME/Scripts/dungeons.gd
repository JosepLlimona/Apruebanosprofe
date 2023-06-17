extends TileMap


var mirar_cartell=false
var cart_visible=false
var mirar_llit = false
signal cartell()


# Called when the node enters the scene tree for the first time.
func _ready():
	mirar_cartell=false
	cart_visible=false
	$AudioStreamPlayer.play()


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
	elif mirar_llit && event.is_action_pressed("Pick"):
		$AudioStreamPlayer.stop()
		$SleepSound.play()
		get_tree().current_scene.get_node("Player").recovery()
		$CanvasLayer/AnimationPlayer.play("FadeToBlack")
		get_tree().paused = true
		var timer = Timer.new()
		add_child(timer)
		timer.connect("timeout", self, "_on_Timer_timeout")
		timer.set_wait_time(8.44)
		timer.set_one_shot(false)
		timer.start()
	else:
		if event.is_action_pressed("Pick") and cart_visible==true:
			cart_visible=false
			Global.amaga_cart()

func _on_Timer_timeout():
	$SleepSound.stop()
	print("Stop Sleeping")
	get_tree().paused = false
	$AudioStreamPlayer.play()
	$CanvasLayer/AnimationPlayer.play("BlackToNormal")
	
func _on_llit_body_entered(body):
	if(body.get_name() == "Player"):
		mirar_llit = true


func _on_llit_body_exited(body):
	if(body.get_name() == "Player"):
		mirar_llit = false
