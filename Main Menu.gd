extends Node2D


export var MainGameScene : PackedScene


func _on_New_Game_button_up():
	get_tree().change_scene("res://Stage 1.tscn")
