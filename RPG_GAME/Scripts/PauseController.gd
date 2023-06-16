class_name PauseController extends CanvasLayer

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		visible = !visible

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
