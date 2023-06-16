extends Node2D

var ESC_DUNG_1:= preload("res://Scenes/dungeon1.tscn")
var ESC_DUNG_2:= preload("res://Scenes/dungeon2.tscn")
var ESC_DUNG_3:= preload("res://Scenes/dungeon3.tscn")
var ESC_CITY:= preload("res://Scenes/city.tscn")
var ESC_OVER:= preload("res://Scenes/overworld.tscn")
var ESC_PERS:= preload("res://Scenes/Player.tscn")
var first_over=true
# Called when the node enters the scene tree for the first time.

var currentSpace = null

func _ready():
	first_over=true
	var pers = ESC_PERS.instance() 
	$".".add_child(pers, true)
	Global.pos_over=$Player.get_global_position()
	iniciar_ciutat()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		print("Falten: ", Global.enemies.size())
		print("Morts: ", Global.dung1EKilled.size(), ": ", Global.dung1EKilled)

func iniciar_ciutat():
	if(!first_over):
		Global.pos_over=$Player.get_global_position()
		$".".remove_child($TileMap)
	var ciutat = ESC_CITY.instance() 
	$".".add_child(ciutat, true)
	#camera limits
	var map_limits = $TileMap.get_used_rect()
	var map_cellsize = $TileMap.cell_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	$".".move_child($Player, 2)
	$Player.set_scale(Vector2(5,5))
	$Player.set_global_position($TileMap/Position2D.get_global_position())
	currentSpace = ciutat

func iniciar_dungeon_1():
	Global.pos_over=$Player.get_global_position()
	get_child(0).queue_free()
	var dung1 = ESC_DUNG_1.instance() 
	call_deferred("add_child", dung1)
	call_deferred("move_child", dung1,0)
	$Player.set_global_position(dung1.get_node("Position2D").position)
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
	currentSpace = dung1

func iniciar_dungeon_2():
	Global.pos_over=$Player.get_global_position()
	get_child(0).queue_free()
	var dung2 = ESC_DUNG_2.instance() 
	call_deferred("add_child", dung2)
	call_deferred("move_child", dung2,0)
	$Player.set_global_position(dung2.position)
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
			Global.enemies.append(child)
	currentSpace = dung2

func iniciar_dungeon_3():
	Global.pos_over=$Player.get_global_position()
	get_child(0).queue_free()
	var dung3 = ESC_DUNG_3.instance() 
	call_deferred("add_child", dung3)
	call_deferred("move_child", dung3, 0)
	$Player.set_global_position(dung3.get_node("Position2D").position)
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
			Global.enemies.append(child)
	currentSpace = dung3

func iniciar_overworld():
	get_child(0).queue_free()
	var overworld = ESC_OVER.instance() 
	call_deferred("add_child", overworld)
	call_deferred("move_child",overworld,0)
	if(first_over):
		first_over=false
		Global.pos_over = overworld.get_node("Position2D").position
	$Player.set_global_position(Global.pos_over)
	#camera limits
	var map_limits = overworld.get_used_rect()
	var map_cellsize = overworld.cell_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	currentSpace = overworld

func activarJoia():
	if currentSpace in "dung":
		currentSpace.get_node("detalls").get_node("ObjecteBase").activar()


func _on_TileMap_cartell():
	$Player/Control.show_text("Hem perdut la espasa, qui la trobi se la pot quedar")

func _on_TileMap_cartell_amaga():
	$Player/Control.hide_text()
