extends Control

@onready var label = $MarginContainer/VBoxContainer/Label
var tween : Tween

func _ready():
	tween = Tween.new()
func _process(delta):
	pass
	#tween.interpolate_value(label, label, 0.2, 1, w )
