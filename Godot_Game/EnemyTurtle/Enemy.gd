extends KinematicBody2D

var gravity = 20
var speed = 130
var motion = Vector2()
var Direction = 1
const UP = Vector2(0,-1)
var sprite_node

var lives = 2

var WalkRight = preload("res://EnemyTurtle/right_turtle.tres")
var WalkLeft = preload("res://EnemyTurtle/left_turtle.tres")

export var score:=150

func _ready():
	sprite_node = get_node("enemy")
	
func _on_DetectStomp_body_entered(body):
	if body.global_position.y>get_node("DetectStomp").global_position.y:
		speed = 0
		
		
		yield(get_tree().create_timer(1.0), "timeout")
		
		return
	if lives==1:
		PlayerData.score +=score
		queue_free()
	else:
		lives=lives-1
		speed+=100
	
func _physics_process(delta):
	motion.y += gravity
	
	if Direction == 0:
		motion.x= speed
	else:
		motion.x= -speed
	motion = move_and_slide(motion, UP)
	if is_on_wall():
		if Direction == 1:
			sprite_node.texture = WalkRight
			Direction =0
			
		else:
			sprite_node.texture = WalkLeft
			Direction = 1
	
func _on_DetectPlayer_body_entered(body):
	if(lives == 2):
		if body.global_position.x>get_node("DetectPlayer").global_position.x:
			Direction = 0
			sprite_node.texture = WalkRight
		else:
			Direction = 1
			sprite_node.texture = WalkLeft
	else:
		if body.global_position.x>get_node("DetectPlayer").global_position.x:
			Direction = 1
			sprite_node.texture = WalkLeft
		else:
			Direction = 0
			sprite_node.texture = WalkRight
		
