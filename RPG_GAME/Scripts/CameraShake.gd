extends Camera2D

var shakeAmount = 0
var defaultOffset = offset
onready var tween = $Tween
onready var timer = $Timer

func _ready():
	set_process(false)
	randomize()
	
func _process(delta):
	offset = Vector2(rand_range(-1,1) * shakeAmount, rand_range(-1,1) * shakeAmount)

func shake(time, amount):
	timer.wait_time = time
	shakeAmount = amount
	set_process(true)
	timer.start()

func _on_Timer_timeout():
	set_process(false)
	tween.interpolate_property(self, "offset", offset, defaultOffset, 0.1, 6, 2)
	tween.start()
