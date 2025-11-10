extends Control

@onready var animation_player = $AnimationPlayer
@onready var tanggal: Label = $MarginContainer/VBoxContainer/Tanggal
@onready var deskripsi: Label = $MarginContainer/VBoxContainer/deskripsi

# Called when the node enters the scene tree for the first time.
func _ready():
	animation_player.play("fade_in")
