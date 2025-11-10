extends Area3D
class_name Intractable

signal intracted(player)

@export var intraction_promp: String = "Press 'E' to intract"
@export var intract_enabled: bool = true

func intract(player) -> void:
	if intract_enabled:
		emit_signal("intracted", player)
		_on_intract(player)
		
func _on_intract(player):
	pass

func get_promp() -> String : return intraction_promp
