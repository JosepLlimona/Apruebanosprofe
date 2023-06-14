class_name PlayerController extends KinematicBody2D

export var speed:float = 200.0
var velocity:Vector2
var isAttacking:bool = false

func _ready():
	$AnimationTree.active = true
	var map_limits = get_parent().get_used_rect()
	var map_cellsize = get_parent().cell_size
	$Camera2D.limit_left = map_limits.position.x * map_cellsize.x
	$Camera2D.limit_right = map_limits.end.x * map_cellsize.x
	$Camera2D.limit_top = map_limits.position.y * map_cellsize.y
	$Camera2D.limit_bottom = map_limits.end.y * map_cellsize.y

func _physics_process(delta):
	var x_axis = Input.get_axis("ui_left","ui_right")
	var y_axis = Input.get_axis("ui_up", "ui_down")
	
	velocity = Vector2(x_axis, y_axis)
	velocity.normalized()
	
	if velocity == Vector2.ZERO:
		$AnimationTree.get("parameters/playback").travel("Idle")
	else:
		$AnimationTree.get("parameters/playback").travel("Walk")
		$AnimationTree.set("parameters/Idle/blend_position", velocity)
		$AnimationTree.set("parameters/Walk/blend_position", velocity)
		$AnimationTree.set("parameters/Attack/blend_position", velocity)
	if Input.is_action_just_pressed("attack"):
		$AnimationTree.get("parameters/playback").travel("Attack")
		
	move_and_slide(velocity * speed)

func attack():
	isAttacking = !isAttacking
	print("isAttakcing = ", isAttacking)
