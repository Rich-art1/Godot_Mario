extends Control

onready var score: Label = get_node("Label")
onready var scene_tree: = get_tree()
onready var pause_overlay: ColorRect = get_node("Overlay")
onready var pause_title: Label = get_node("Overlay/Title")

var paused: = false setget set_paused
 
func _ready():
	scene_tree.paused=false
	PlayerData.connect("score_updated",self,"update_interface")
	PlayerData.connect("player_died",self,"_PlayerData_player_died")
	update_interface()
	$AudioStreamPlayer.play()
	
	

func _PlayerData_player_died():
	self.paused = true
	$AudioStreamPlayer.stop()
	$DeathAudioStreamPlayer.play()
	pause_title.text = "You died"
	

func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("pause"):
		self.paused= not paused
		scene_tree.set_input_as_handled()

func update_interface():
	score.text = "Score: %s        " %PlayerData.score
	

func set_paused(value:bool) ->void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value
