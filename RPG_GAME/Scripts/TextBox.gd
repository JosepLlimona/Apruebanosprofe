extends Area2D

var dintre=false


func _on_Area2D_mouse_entered():
	dintre=true
	print("dintre")

func _on_Area2D_mouse_exited():
	dintre=false
	print("fora")

func posar_text(text):
	$RichTextLabel.set_text(text)
	$RichTextLabel/Tween.interpolate_property($RichTextLabel, "percent_visible", 0.0, 1.0, 1.0,Tween.TRANS_LINEAR)
	$RichTextLabel/Tween.start()
