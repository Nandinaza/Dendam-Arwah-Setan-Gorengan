extends Node3D

@export var character: CharacterBody3D

func _ready() -> void:
	#load some sound settings
	FadeTransition.play_fade_in("12 Agustus 2034", "Lokasi Rumah Pito")
	
	await FadeTransition.animation_player.animation_finished
	
	if character.has_method("show_AIM"):
		character.show_AIM()
