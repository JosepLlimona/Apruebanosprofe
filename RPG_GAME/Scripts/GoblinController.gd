class_name GoblinController extends PathFollow2D

export var speed:float = 5.0
export var maxDistance:float = 60.0
export var attackVelocity:float = 3.0

var arrowScene = preload("res://Scenes/Arrow.tscn")

var player:PlayerController
var moving:bool = true
var touchingPlayer:bool = false
var timer:Timer = null
var isShooting:bool = false
var shooting:bool = false

func _ready():
	$Area2D/AnimationTree.active = true
	player = get_parent().get_parent().get_node("Player")

func _physics_process(delta):
	var playerDir = global_position.direction_to(player.global_position)
	$Area2D/RayCast2D.cast_to = playerDir * maxDistance
	$Area2D/RayCast2D.force_raycast_update()
	if moving:
		$Area2D/AnimationTree.get("parameters/playback").travel("Walk")
		var old_pos = position
		set_offset(get_offset() + speed + delta)
		var direction = position - old_pos
		$Area2D/AnimationTree.set("parameters/Idle/blend_position", direction.normalized())
		$Area2D/AnimationTree.set("parameters/Walk/blend_position", direction.normalized())
		$Area2D/AnimationTree.set("parameters/Shoot/blend_position", direction.normalized())
	elif !moving && !shooting:
		$Area2D/AnimationTree.get("parameters/playback").travel("Idle")
	
	if $Area2D/RayCast2D.get_collider() != null && ($Area2D/RayCast2D.get_collider().name == "Player" || $Area2D/RayCast2D.get_collider().name == "Arrow"):
		moving = false
		var dir = (player.position - self.position).normalized()
		$Area2D/AnimationTree.set("parameters/Idle/blend_position", dir)
		if !isShooting:
			isShooting = true
			timer = Timer.new()
			add_child(timer)
			timer.connect("timeout", self, "_on_Timer_timeout")
			timer.set_wait_time(attackVelocity)
			timer.set_one_shot(false)
			timer.start()
	else:
		if timer != null:
			isShooting = false
			timer.queue_free()
			timer = null
		moving = true
	
	if touchingPlayer && player.isAttacking:
		self.queue_free()

func _on_Timer_timeout():
	shooting = true
	var direction = (player.position - self.position).normalized()
	var arrow = arrowScene.instance()
	arrow.direction = direction
	arrow.global_position = $Area2D/RayCast2D.global_position
	add_child(arrow)
	$Area2D/AnimationTree.get("parameters/playback").travel("Shoot")
	
func shoot():
	shooting = false

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		print("Player entrat")
		touchingPlayer = true


func _on_Area2D_body_exited(body):
	if body.name == "Player":
		print("Player sortit")
		touchingPlayer = false
