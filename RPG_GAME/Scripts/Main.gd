extends Node2D

var ESC_DUNG_1:= preload("res://Scenes/dungeon1.tscn")
var ESC_DUNG_2:= preload("res://Scenes/dungeon2.tscn")
var ESC_DUNG_3:= preload("res://Scenes/dungeon3.tscn")
var ESC_CITY:= preload("res://Scenes/city.tscn")
var ESC_OVER:= preload("res://Scenes/overworld.tscn")
var ESC_PERS:= preload("res://Scenes/Player.tscn")
# Called when the node enters the scene tree for the first time.

var currentSpace = null

func _ready():
	var pers = ESC_PERS.instance()
	pers.set_scale(Vector2(5,5)) 
	add_child(pers, true)
	if Global.isLoad:
		if Global.currentScene == "dung1":
			iniciar_dungeon_1()
		elif Global.currentScene == "dung2":
			iniciar_dungeon_2()
		elif Global.currentScene == "dung3":
			iniciar_dungeon_3()
		elif Global.currentScene == "overworld":
			iniciar_overworld()
		else:
			iniciar_ciutat()
	else:
		Global.first_over=true
		iniciar_ciutat()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("Falten: ", Global.enemies.size(), ": ", Global.enemies)
		if Global.currentScene == "dung1":
			print("Morts: ", Global.dung1EKilled.size(), ": ", Global.dung1EKilled)
		if Global.currentScene == "dung2":
			print("Morts: ", Global.dung2EKilled.size(), ": ", Global.dung2EKilled)
		if Global.currentScene == "dung3":
			print("Morts: ", Global.dung3EKilled.size(), ": ", Global.dung3EKilled)
		print("Tree: ", get_children())
		print("Local pos: ", Global.pos_load)
		print("Over pos: ", Global.pos_over)
		print("Rubi: ", Global.rubi_agafat, " Ambar: ", Global.ambar_agafat, " Zafir: ", Global.zafir_agafat)

func iniciar_ciutat():
	if(!Global.first_over):
		if "TileMap" in get_child(0).name:
			get_child(0).queue_free()
	var ciutat = ESC_CITY.instance() 
	add_child(ciutat, true)
	#camera limits
	var map_limits = ciutat.get_used_rect()
	var map_cellsize = ciutat.cell_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	move_child($Player, 2)
	$Player.set_global_position($TileMap/Position2D.get_global_position())
	if Global.isLoad:
		$Player.set_global_position(Global.pos_load)
		if Global.espasa_agafada:
			print("Entro")
			ciutat.get_node("ObjecteBase").queue_free()
	Global.currentScene = "city"
	currentSpace = ciutat

func iniciar_dungeon_1():
	if "TileMap" in get_child(0).name:
		get_child(0).queue_free()
	var dung1 = ESC_DUNG_1.instance() 
	call_deferred("add_child", dung1)
	call_deferred("move_child", dung1,0)
	$Player.set_global_position(dung1.get_node("Position2D").position)
	if Global.isLoad && !Global.first_dung1:
		$Player.set_global_position(Global.pos_load)
	Global.first_dung1 = false
	#camera limits
	var map_limits = dung1.get_used_rect()
	var map_cellsize = dung1.cell_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	Global.enemies.clear()
	for child in dung1.get_children():
		if child.is_class("Path2D"):
			Global.enemies.append(child.name)
	for g in Global.dung1EKilled:
		var eIndex = Global.enemies.find(g)
		dung1.get_node(g).queue_free()
		Global.enemies.remove(eIndex)
	Global.currentScene = "dung1"
	currentSpace = dung1

func iniciar_dungeon_2():
	if "TileMap" in get_child(0).name:
		get_child(0).queue_free()
	var dung2 = ESC_DUNG_2.instance() 
	call_deferred("add_child", dung2)
	call_deferred("move_child", dung2,0)
	$Player.set_global_position(dung2.get_node("Position2D").position)
	if Global.isLoad && !Global.first_dung2:
		$Player.set_global_position(Global.pos_load)
	Global.first_dung2 = false
	#camera limits
	var map_limits = dung2.get_used_rect()
	var map_cellsize = dung2.cell_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	Global.enemies.clear()
	for child in dung2.get_children():
		if child.is_class("Path2D"):
			Global.enemies.append(child.name)
	for g in Global.dung2EKilled:
		var eIndex = Global.enemies.find(g)
		dung2.get_node(g).queue_free()
		Global.enemies.remove(eIndex)
	Global.currentScene = "dung2"
	currentSpace = dung2

func iniciar_dungeon_3():
	if "TileMap" in get_child(0).name:
		get_child(0).queue_free()
	var dung3 = ESC_DUNG_3.instance() 
	call_deferred("add_child", dung3)
	call_deferred("move_child", dung3, 0)
	$Player.set_global_position(dung3.get_node("Position2D").position)
	if Global.isLoad && !Global.first_dung3:
		$Player.set_global_position(Global.pos_load)
	Global.first_dung3 = false
	#camera limits
	var map_limits = dung3.get_used_rect()
	var map_cellsize = dung3.cell_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	Global.enemies.clear()
	for child in dung3.get_children():
		if child.is_class("Path2D"):
			Global.enemies.append(child.name)
	for g in Global.dung3EKilled:
		var eIndex = Global.enemies.find(g)
		dung3.get_node(g).queue_free()
		Global.enemies.remove(eIndex)
	Global.currentScene = "dung3"
	currentSpace = dung3

func iniciar_overworld():
	if "TileMap" in get_child(0).name:
		Global.pos_load = get_child(0).get_node("Position2D").position
		get_child(0).queue_free()
	var overworld = ESC_OVER.instance() 
	call_deferred("add_child", overworld)
	call_deferred("move_child",overworld,0)
	if(Global.first_over):
		Global.first_over=false
		Global.pos_over = overworld.get_node("Position2D").position
	$Player.set_global_position(Global.pos_over)
	#camera limits
	var map_limits = overworld.get_used_rect()
	var map_cellsize = overworld.cell_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	Global.currentScene = "overworld"
	currentSpace = overworld
	print(get_children())

func activarJoia():
	print(Global.currentScene)
	if "dung" in Global.currentScene:
		currentSpace.get_node("detalls").get_node("ObjecteBase").activar()


func _on_TileMap_cartell():
	$Player/Control.show_text("Hem perdut la espasa, qui la trobi se la pot quedar")

func _on_TileMap_cartell_amaga():
	$Player/Control.hide_text()
	
func get_player_pos():
	return $Player.get_global_position()
	
func exit():
	for n in get_children():
		remove_child(n)
		n.queue_free()
