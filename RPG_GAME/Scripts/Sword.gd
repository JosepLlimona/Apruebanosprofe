extends Area2D

var contact=false

# Called when the node enters the scene tree for the first time.
func _ready():
	contact=false

func _unhandled_input(event:InputEvent) -> void:
	if contact:
		if event.is_action_pressed("Pick"):
			$AudioStreamPlayer.play()
			Global.agafar_objecte("espasa")
			visible = false
			yield(get_tree().create_timer(0.49), "timeout")
			queue_free()

func activar():
	self.monitoring = true

func _on_ObjecteBase_body_entered(body):
	contact=true

func _on_ObjecteBase_body_exited(body):
	contact=false
