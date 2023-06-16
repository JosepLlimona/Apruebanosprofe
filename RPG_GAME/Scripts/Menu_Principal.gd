extends Node2D

func _ready():
	$RichTextLabel.set_text("El protagonista desperta en un petit poblat buit sense cap record, tot i buscar no troba a ningu, només recorda que els goblins li han fet perdre els records i ara ell els farà perdre el que mes estimen, les 3 Joies sagrades que guarden a les Masmorres del regne, no sense abans, MATARLOS A TOTS.")
	$RichTextLabel/Tween.interpolate_property($RichTextLabel, "percent_visible", 0.0, 1.0, 1.0,Tween.TRANS_LINEAR)
	$RichTextLabel/Tween.start()

func _on_start_pressed():
	get_tree().paused = false
	Global.iniciar_joc()


func _on_sortir_pressed():
	get_tree().quit()


func _on_load_pressed():
	get_tree().paused = false
	Global.load_game()
