extends Node2D

var scene1 = preload("res://story/level1/intro.tscn")
var loading_instance
onready var timer = $"5sec"

func _ready():
	$AudioStreamPlayer.play(20.0)

func _on_play_pressed():
	#get_tree().change_scene("res://story/level1/level1.tscn")
	
	var loading_screen = preload("res://Loading_0.tscn")
	loading_instance = loading_screen.instance()
	add_child(loading_instance)
	
	timer.start()

func _on_5sec_timeout():
	get_tree().change_scene_to(scene1)
