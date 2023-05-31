extends KinematicBody2D

var gravity = 20
var speed = 200
var motion = Vector2()
var Direction = 1
const UP = Vector2(0,-1)
var sprite_node

var lives = 2



export var score:=100

func _ready():
	sprite_node = get_node("enemy")
	
func _on_DetectStomp_body_entered(body):
	if body.global_position.y>get_node("DetectStomp").global_position.y:
		speed = 0
		yield(get_tree().create_timer(1.0), "timeout")
		return
	PlayerData.score +=score
	queue_free()
	
func _physics_process(delta):
	motion.y += gravity
	
	if Direction == 0:
		motion.x= speed
	else:
		motion.x= -speed
	motion = move_and_slide(motion, UP)
	if is_on_wall():
		if Direction == 1:
			Direction =0
		else:
			Direction = 1
	
	



