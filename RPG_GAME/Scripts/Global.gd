extends Node

var ESC_MAIN:= preload("res://Scenes/Main.tscn")
var ESC_MENU:= preload("res://Scenes/Menu_Principal.tscn")

var espasa_agafada=true
var rubi_agafat=false
var zafir_agafat=false
var ambar_agafat=false
var pos_over

var enemies = []
var dung1EKilled = []
var dung2EKilled = []
var dung3EKilled = []


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

func sortir_menu():
	get_tree().change_scene_to(ESC_MENU)
