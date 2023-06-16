extends Node2D

func _ready():
	pass # Replace with function body.

func _on_start_pressed():
	Global.iniciar_joc()
	get_tree().paused = false


func _on_sortir_pressed():
	get_tree().quit()
