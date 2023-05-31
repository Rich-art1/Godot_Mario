extends KinematicBody2D


var sprite_node

func _ready():
	sprite_node = get_node("Sprite")

var JumpRight = preload("res://PlayerTexture/JumpRight.png")
var JumpLeft = preload("res://PlayerTexture/JumpLeft.png")
var StandRight = preload("res://PlayerTexture/StandRight.png")
var StandLeft = preload("res://PlayerTexture/StandLeft.png")
var WalkRight = preload("res://PlayerTexture/RunRightAnimation/WalkRight.tres")
var WalkLeft = preload("res://PlayerTexture/RunLeftAnimation/WalkLeft.tres")
#animacja
var Direction =0
#movement
var gravity = 20
var speed = 300
var jumpHeight = 700
var motion = Vector2()
const UP = Vector2(0,-1)

func die():
	PlayerData.score = 0
	PlayerData.deaths +=1
	queue_free()

func _on_DetectEnemy_body_entered(body):
	die()

func _on_DetectEnemy_area_entered(area):
	motion.y = -900
	if Direction == 0:
		sprite_node.texture = JumpRight
	if Direction == 1:
		sprite_node.texture = JumpLeft


func _physics_process(delta):
	
	if sprite_node.global_position.y>600:
		die()
		
	motion.y += gravity
	
	if Input.is_action_pressed("ui_right"):
		motion.x= speed
		sprite_node.texture = WalkRight
		Direction=0

		
	elif Input.is_action_pressed("ui_left"):
		motion.x= -speed
		sprite_node.texture = WalkLeft
		Direction=1
		
	else:
		if Direction==0:
			sprite_node.texture = StandRight
		else:
			sprite_node.texture = StandLeft
		motion.x = 0
	
	if is_on_floor():
			
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -jumpHeight
		#else:
			#_animated_sprite.stop()
	else:
		if Direction == 0:
			sprite_node.texture = JumpRight
		if Direction == 1:
			sprite_node.texture = JumpLeft
	motion = move_and_slide(motion, UP)







