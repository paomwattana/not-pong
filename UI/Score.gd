extends Control



var score = 0

func _on_ScoreTimer_timeout():
	score += 20
	$Score.text = "Score :: " + str(score)
