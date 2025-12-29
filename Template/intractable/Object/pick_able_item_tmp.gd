extends Intractable

func _ready() -> void:
	print(intraction_promp)

func _on_intract(player):
	Dialogic.start(
		"res://dialogic/Rumah_pito_0/pito_ulang_tahun_0.dtl"
	)
	#if player.has_method("add_to_inventory"):
		#player.add_to_inventory("key", 123)
		#queue_free()
