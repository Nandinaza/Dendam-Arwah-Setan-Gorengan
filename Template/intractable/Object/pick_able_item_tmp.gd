extends Intractable

@export var dialog_DLG: DialogicTimeline

func _ready() -> void:
	print(intraction_promp)

func _on_intract(player):
	if dialog_DLG :
		print("that bang")
		Dialogic.start(dialog_DLG)

	#if player.has_method("add_to_inventory"):
		#player.add_to_inventory("key", 123)
		#queue_free()
