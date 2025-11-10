extends Intractable

func _ready() -> void:
	print(intraction_promp)

func _on_intract(player):
	if player.has_method("add_to_inventory"):
		player.add_to_inventory("key", 123)
		queue_free()
