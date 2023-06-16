extends Node2D

var ESC_DUNG_1:= preload("res://Scenes/dungeon1.tscn")
var ESC_DUNG_2:= preload("res://Scenes/dungeon2.tscn")
var ESC_DUNG_3:= preload("res://Scenes/dungeon3.tscn")
var ESC_CITY:= preload("res://Scenes/city.tscn")
var ESC_OVER:= preload("res://Scenes/overworld.tscn")
var ESC_PERS:= preload("res://Scenes/Player.tscn")
var first_over=true
# Called when the node enters the scene tree for the first time.


func _ready():
	first_over=true
	var pers = ESC_PERS.instance() 
	$".".add_child(pers, true)
	Global.pos_over=$Player.get_global_position()
	iniciar_ciutat()

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

func iniciar_dungeon_1():
	Global.pos_over=$Player.get_global_position()
	$".".remove_child($TileMap)
	var dung1 = ESC_DUNG_1.instance() 
	$".".add_child(dung1, true)	
	$Player.set_global_position($TileMap/Position2D.get_global_position())
	#camera limits
	var map_limits = $TileMap.get_used_rect()
	var map_cellsize = $TileMap.cell_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	$".".move_child($Player, 2)
	for child in $TileMap.get_children():
		if child.is_class("Path2D"):
			Global.enemies.append(child)

func iniciar_dungeon_2():
	Global.pos_over=$Player.get_global_position()
	$".".remove_child($TileMap)
	var dung2 = ESC_DUNG_2.instance() 
	$".".add_child(dung2, true)	
	$Player.set_global_position($TileMap/Position2D.get_global_position())
	#camera limits
	var map_limits = $TileMap.get_used_rect()
	var map_cellsize = $TileMap.cell_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	$".".move_child($Player, 2)

func iniciar_dungeon_3():
	Global.pos_over=$Player.get_global_position()
	$".".remove_child($TileMap)
	var dung3 = ESC_DUNG_3.instance() 
	$".".add_child(dung3, true)	
	$Player.set_global_position($TileMap/Position2D.get_global_position())
	#camera limits
	var map_limits = $TileMap.get_used_rect()
	var map_cellsize = $TileMap.cell_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	$".".move_child($Player, 2)

func iniciar_overworld():
	$".".remove_child($TileMap)
	var overworld = ESC_OVER.instance() 
	$".".add_child(overworld, true)	
	if(first_over):
		first_over=false
		Global.pos_over=$TileMap/Position2D.get_global_position()
	$Player.set_global_position(Global.pos_over)
	#camera limits
	var map_limits = $TileMap.get_used_rect()
	var map_cellsize = $TileMap.cell_size
	$Player/Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Player/Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Player/Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Player/Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y
	$".".move_child($Player, 2)

func activarJoia():
	$TileMap.get_node("detalls").get_node("ObjecteBase").activar()


func _on_TileMap_cartell():
	$Player/Control.show_text("Hem perdut la espasa, qui la trobi se la pot quedar")

func _on_TileMap_cartell_amaga():
	$Player/Control.hide_text()
