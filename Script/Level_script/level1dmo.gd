extends Node3D

func _ready():
	FadeTransition.connect("transition_finished", start_dialog)
	FadeTransition.play_fade_in("dk.warni", "sutu desa")

func start_dialog():
	Dialogic.start("res://dialogic/Kamar_galuh/galuh1.dtl")
	$CharacterTemplate.show_AIM()
