extends Control

#here is have many dialog data
onready var rich = $VBoxContainer/TextureRect/RichTextLabel
onready var twen = $Tween
var index = 0

var dila = Indonesian.dialog1

func _on_next_pressed():
	rich.text = dila[index]
	index += 1
	print(index)
	
