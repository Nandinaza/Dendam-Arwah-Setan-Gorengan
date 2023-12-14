extends Control

#here is have many dialog data
onready var rich = $VBoxContainer/TextureRect/RichTextLabel
onready var twen = $Tween
var index = 0

var dila

func load_dialog(dialog):
	dila = dialog

func _on_next_pressed():
	if index == len(dila):
		return
	rich.text = dila[index]
	twen.interpolate_property(
		rich,"percent_visible",0,1,0.5,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT
	)
	twen.start()
	index += 1
	print(index)

func and_show(val):
	$VBoxContainer.visible = val
	$next.visible = val
	$intract.visible = val
	
func show_intract(val):
	$intract.visible = val
