extends Node2D

func _ready():
	pass # Replace with function body.

func _on_start_pressed():
	get_tree().paused = false
	Global.iniciar_joc()


func _on_sortir_pressed():
	get_tree().quit()


func _on_load_pressed():
	get_tree().paused = false
	Global.load_game()
