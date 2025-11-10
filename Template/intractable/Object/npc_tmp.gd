extends Intractable

@export var npc_name: String ="akbar"
@export var dialogue_tree: Array[String] = ["hello", "world"]

var dialogue_index = 0

signal dialog_started(npc, dialogue)
signal dialog_ended(npc)

func _on_intract(player):
	if dialogue_tree.is_empty():
		return
		
	dialogue_index = 0
	#please configure dialogic HERE
		
	#show_dialogue dialogue_tree[index]
	emit_signal("dialog_started", self, dialogue_tree[dialogue_index])
