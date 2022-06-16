extends Control



func _ready():
	pass

func _on_RestartButton_pressed():
	get_tree().change_scene("res://World.tscn")

func _on_HomeButton_pressed():
	get_tree().change_scene("res://UI.tscn")
