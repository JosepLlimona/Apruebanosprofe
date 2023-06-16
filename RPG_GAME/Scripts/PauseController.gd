class_name PuaseController extends CanvasLayer

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().paused = !get_tree().paused
		visible = !visible

func _on_ContinueButton_pressed():
	self.visible = false
	get_tree().paused = false


func _on_ExitButton_pressed():
	print("Sortir")


func _on_ExitGameButton_pressed():
	get_tree().quit()
