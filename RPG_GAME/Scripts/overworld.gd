extends TileMap

var area_dung1=false
var area_dung2=false
var area_dung3=false
var area_city=false

func _ready():
	area_dung1=false
	area_dung2=false
	area_dung3=false
	area_city=false
	$AudioStreamPlayer.play()

func _unhandled_input(event:InputEvent) -> void:
	if event.is_action_pressed("Pick"):
		if(area_city and !Global.espasa_agafada):
			Global.pos_over=get_parent().get_node("Player").get_global_position()
			Global.entrar_instancia("city")
		elif(area_dung1 and !Global.rubi_agafat):
			Global.pos_over=get_parent().get_node("Player").get_global_position()
			Global.entrar_instancia("dung1")
		elif(area_dung2 and Global.rubi_agafat and !Global.ambar_agafat):
			print("Entrant dung2")
			Global.pos_over=get_parent().get_node("Player").position
			Global.entrar_instancia("dung2")
		elif(area_dung3 and Global.rubi_agafat and Global.ambar_agafat and !Global.zafir_agafat):
			Global.pos_over=get_parent().get_node("Player").get_global_position()
			Global.entrar_instancia("dung3")

func _on_City_body_entered(body):
	area_city=true


func _on_City_body_exited(body):
	area_city=false


func _on_Dung1_body_entered(body):
	area_dung1=true


func _on_Dung1_body_exited(body):
	area_dung1=false


func _on_Dung2_body_entered(body):
	area_dung2=true


func _on_Dung2_body_exited(body):
	area_dung2=false


func _on_Dung3_body_entered(body):
	area_dung3=true


func _on_Dung3_body_exited(body):
	area_dung3=false
