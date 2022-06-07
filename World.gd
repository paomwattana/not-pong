extends Node2D


signal game_over

export (PackedScene) var ball
var LIFE = 5
var score = 0

#####################
# built-in

func _ready():
	set_hp()
	$Score/ScoreTimer.start()

####################
# helper functions

func set_hp():
	$Life.text = "HP :: " + str(LIFE)

func game_over():
	print("game over")
	emit_signal("game_over") # in case any other nodes wanted to use this
	$Score/ScoreTimer.stop()
	
	get_tree().call_group("balls", "queue_free")
	get_tree().change_scene("res://UI.tscn")


func _on_Goal_body_entered(body):
	# remove ball after ball enters goal
	
	# calculate hp
	LIFE -= 1
	if (LIFE <= 0):
		game_over()
	set_hp()


func _on_BallSpawnTimer_timeout():
	var ball1 = ball.instance()
	add_child(ball1)
	$BallSpawnTimer.start()
