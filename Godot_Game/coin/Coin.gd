extends Area2D


onready var anim_player: AnimationPlayer = get_node("AnimationPlayer")

export var score:=100
var visited = 0

func _on_Coin_body_entered(body: PhysicsBody2D) ->void:
	if visited == 0:
		visited = 1
		PlayerData.score += score 
		anim_player.play("PickedCoin")
		$coin/AudioStreamPlayer.play()


