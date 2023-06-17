class_name PlayerController extends KinematicBody2D

export var speed:float = 200.0
var velocity:Vector2
var isAttacking:bool = false
var life = 3
var maxHealt = 3
var timer:Timer

func _ready():
	$Control.startGame(life)
	$AnimationTree.active = true

func _physics_process(delta):
	
	var x_axis = Input.get_axis("ui_left","ui_right")
	var y_axis = Input.get_axis("ui_up", "ui_down")
	
	velocity = Vector2(x_axis, y_axis)
	velocity.normalized()
	
	if velocity == Vector2.ZERO:
		isAttacking = false
		$AnimationTree.get("parameters/playback").travel("Idle")
	else:
		isAttacking = false
		$AnimationTree.get("parameters/playback").travel("Walk")
		$AnimationTree.set("parameters/Idle/blend_position", velocity)
		$AnimationTree.set("parameters/Walk/blend_position", velocity)
		$AnimationTree.set("parameters/Attack/blend_position", velocity)
	if Input.is_action_just_pressed("attack") && !isAttacking && Global.espasa_agafada:
		$AnimationTree.get("parameters/playback").travel("Attack")
		
	move_and_slide(velocity * speed)

func attack():
	isAttacking = !isAttacking

func addLife():
	life += 1
	maxHealt +=1
	$Control.addHeart()

func getHurt():
	$Camera2D.shake(0.1,10)
	$Control.removeHeart()
	life -= 1
	if life <= 0:
		life = maxHealt
		for i in life:
			$Control.addHeart()
		Global.enemies.clear()
		Global.dung1EKilled.clear()
		Global.dung2EKilled.clear()
		Global.dung3EKilled.clear()
		get_tree().current_scene.iniciar_overworld()
