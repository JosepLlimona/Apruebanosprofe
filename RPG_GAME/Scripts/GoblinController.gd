class_name GoblinController extends PathFollow2D

export var speed = 50
export var maxDistance = 60

var player
var moving = true

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
	else:
		$Area2D/AnimationTree.get("parameters/playback").travel("Idle")
	
	if $Area2D/RayCast2D.get_collider() != null && $Area2D/RayCast2D.get_collider().name == "Player":
		moving = false
		var dir = (player.position - self.position).normalized()
		$Area2D/AnimationTree.set("parameters/Idle/blend_position", dir)
	else:
		moving = true
