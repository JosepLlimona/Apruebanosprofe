class_name PauseController extends CanvasLayer

var currentButton = 0

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		visible = !visible
		get_child(0).grab_focus()

func _on_ContinueButton_pressed():
	self.visible = false
	get_tree().paused = false


func _on_ExitButton_pressed():
	Global.sortir_menu()


func _on_ExitGameButton_pressed():
	get_tree().quit()
	
func _on_Save_pressed():
	var file = File.new()
	var data = Global.get_json()
	file.open(Global.FILE_NAME, File.WRITE)
	file.store_string(to_json(data))
	file.close()


func _on_ContinueButton_mouse_entered():
	$ContinueButton.grab_focus()

func _on_ExitButton_mouse_entered():
	$ExitButton.grab_focus()

func _on_ExitGameButton_mouse_entered():
	$ExitGameButton.grab_focus()


func _on_Save_mouse_entered():
	$Save.grab_focus()

func _on_ContinueButton_focus_entered():
	$ContinueButton.rect_scale += Vector2(0.3,0.3)
	$AudioStreamPlayer.play()


func _on_ContinueButton_focus_exited():
	$ContinueButton.rect_scale -= Vector2(0.3,0.3)


func _on_Save_focus_entered():
	$Save.rect_scale += Vector2(0.3,0.3)
	$AudioStreamPlayer.play()


func _on_Save_focus_exited():
	$Save.rect_scale -= Vector2(0.3,0.3)


func _on_ExitButton_focus_entered():
	$ExitButton.rect_scale += Vector2(0.3,0.3)
	$AudioStreamPlayer.play()

func _on_ExitButton_focus_exited():
	$ExitButton.rect_scale -= Vector2(0.3,0.3)

func _on_ExitGameButton_focus_entered():
	$ExitGameButton.rect_scale += Vector2(0.3,0.3)
	$AudioStreamPlayer.play()

func _on_ExitGameButton_focus_exited():
	$ExitGameButton.rect_scale -= Vector2(0.3,0.3)

