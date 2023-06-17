extends Node2D


func _ready():
	$RichTextLabel.set_text("El protagonista desperta en un petit poblat buit sense cap record, tot i buscar no troba a ningu, només recorda que els goblins li han fet perdre els records i ara ell els farà perdre el que mes estimen, les 3 Joies sagrades que guarden a les Masmorres del regne, no sense abans, MATARLOS A TOTS.")
	$RichTextLabel/Tween.interpolate_property($RichTextLabel, "percent_visible", 0.0, 1.0, 1.0,Tween.TRANS_LINEAR)
	$RichTextLabel/Tween.start()
	$start.grab_focus()
	$AudioStreamPlayer.play()


func _on_start_pressed():
	get_tree().paused = false
	Global.iniciar_joc()


func _on_sortir_pressed():
	get_tree().quit()


func _on_load_pressed():
	get_tree().paused = false
	Global.load_game()


func _on_start_mouse_entered():
	$start.grab_focus()


func _on_sortir_mouse_entered():
	$sortir.grab_focus()


func _on_load_mouse_entered():
	$load.grab_focus()


func _on_start_focus_entered():
	$start.rect_scale += Vector2(0.3,0.3)
	$SelectSound.play()

func _on_start_focus_exited():
	$start.rect_scale -= Vector2(0.3,0.3)


func _on_sortir_focus_entered():
	$sortir.rect_scale += Vector2(0.3,0.3)
	$SelectSound.play()


func _on_sortir_focus_exited():
	$sortir.rect_scale -= Vector2(0.3,0.3)


func _on_load_focus_entered():
	$load.rect_scale += Vector2(0.3,0.3)
	$SelectSound.play()


func _on_load_focus_exited():
	$load.rect_scale -= Vector2(0.3,0.3)


func _on_Tween_tween_step(object, key, elapsed, value):
	$TetxSound.play()
