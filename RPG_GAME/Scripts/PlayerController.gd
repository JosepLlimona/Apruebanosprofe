class_name PlayerController extends KinematicBody2D

export var speed = 200
var velocity

func _ready():
	$AnimationTree.active = true

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
