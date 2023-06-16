extends Node

var ESC_MAIN:= preload("res://Scenes/Main.tscn")
var ESC_MENU:= preload("res://Scenes/Menu_Principal.tscn")
var ESC_FINAL:= preload("res://Scenes/escena_final.tscn")


var espasa_agafada = true
var rubi_agafat = true
var zafir_agafat = false
var ambar_agafat = false
var pos_over
var pos_load
var currentScene = ""
var first_over = true
var first_dung1 = true
var first_dung2 = true
var first_dung3 = true

var enemies = []
var dung1EKilled = []
var dung2EKilled = []
var dung3EKilled = []

var data
var FILE_NAME = "user://savegame.json"
var isLoad = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func agafar_objecte(obj):
	if(obj=="espasa"):
		print("espasa")
		espasa_agafada=true
	elif(obj=="rubi"):
		print("rubi")
		rubi_agafat=true
	elif(obj=="ambar"):
		print("ambar")
		ambar_agafat=true
	elif(obj=="zafir"):
		print("zafir")
		zafir_agafat=true
		get_tree().current_scene.exit()
		get_tree().change_scene_to(ESC_FINAL)

func surt_instancia():
	get_node("/root/Main_scenario").iniciar_overworld()

func entrar_instancia(inst):
	if(inst=="city"):
		get_node("/root/Main_scenario").iniciar_ciutat()
	elif(inst=="dung1"):
		get_node("/root/Main_scenario").iniciar_dungeon_1()
	elif(inst=="dung2"):
		get_node("/root/Main_scenario").iniciar_dungeon_2()
	elif(inst=="dung3"):
		get_node("/root/Main_scenario").iniciar_dungeon_3()

func mirar_cart():
	get_node("/root/Main_scenario")._on_TileMap_cartell()

func amaga_cart():
	get_node("/root/Main_scenario")._on_TileMap_cartell_amaga()

func iniciar_joc():
	get_tree().change_scene_to(ESC_MAIN)
	isLoad = false

func sortir_menu():
	get_tree().current_scene.exit()
	get_tree().change_scene_to(ESC_MENU)
	
func reiniciar_menu():
	get_tree().change_scene_to(ESC_MENU)
	
func get_json():
	if currentScene == "overworld":
		pos_over = get_tree().current_scene.get_player_pos()
	var ret = {
		"espasa_agafada" : espasa_agafada,
		"rubi_agafat": rubi_agafat,
		"zafir_agafat": zafir_agafat,
		"ambar_agafat": ambar_agafat,
		"dung1EKilled": dung1EKilled,
		"dung2EKilled": dung2EKilled,
		"dung3EKilled": dung3EKilled,
		"pos_load": var2str(get_tree().current_scene.get_player_pos()),
		"pos_over": var2str(pos_over),
		"current_scene": currentScene,
		"first_over": first_over,
		"first_dung1": first_dung1,
		"first_dung2": first_dung2,
		"first_dung3": first_dung3
	}
	return ret
	
func load_game():
	var file = File.new()
	if file.file_exists(FILE_NAME):
		file.open(FILE_NAME,File.READ)
		data = parse_json(file.get_as_text())
		file.close()
		espasa_agafada = data.espasa_agafada
		rubi_agafat = data.rubi_agafat
		zafir_agafat = data.rubi_agafat
		ambar_agafat = data.ambar_agafat
		dung1EKilled = data.dung1EKilled
		dung2EKilled = data.dung2EKilled
		dung3EKilled = data.dung3EKilled
		currentScene = data.current_scene
		pos_load = str2var(data.pos_load)
		pos_over = str2var(data.pos_over)
		first_over = data.first_over
		first_dung1 = data.first_dung1
		first_dung2 = data.first_dung2
		first_dung3 = data.first_dung3
		iniciar_joc()
		isLoad = true
		print(data)
	else:
		print("Arxiu no guardat")
