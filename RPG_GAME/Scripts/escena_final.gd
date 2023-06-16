extends Node2D

func _ready():
	$RichTextLabel.set_text("Un cop aconseguida la ultima gema, el protagonista recupera els records com si es tractés d'un encanteri que s'ha trencat, ara al mig de la ultima masmorra amb la sang del ultim goblin sobre la seva espasa mira cap al sostre i esgotat mentre suspira diu -M'he equivocat de poble-")
	$RichTextLabel/Tween.interpolate_property($RichTextLabel, "percent_visible", 0.0, 1.0, 1.0,Tween.TRANS_LINEAR)
	$RichTextLabel/Tween.start()

func _on_menu_pressed():
	get_tree().paused = false
	Global.reiniciar_menu()


func _on_sortir_pressed():
	get_tree().quit()
