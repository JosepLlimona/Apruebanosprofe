extends Area2D

var contact=false

# Called when the node enters the scene tree for the first time.
func _ready():
	contact=false

func _unhandled_input(event:InputEvent) -> void:
	if contact:
		if event.is_action_pressed("Pick"):
			$AudioStreamPlayer.play()
			visible = false
			Global.agafar_objecte("ambar")
			get_tree().current_scene.get_node("Player").addLife()
			yield(get_tree().create_timer(0.49), "timeout")
			queue_free()

func activar():
	self.visible = true
	self.monitoring = true

func _on_ObjecteBase_body_entered(body):
	contact=true

func _on_ObjecteBase_body_exited(body):
	contact=false
