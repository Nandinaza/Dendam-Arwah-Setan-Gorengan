extends Intractable

enum State { OPEN, CLOSE }

@export var current_state = State.CLOSE
@export var on_promp: String = "press 'E' to open"
@export var off_promp: String = "Press 'E' to close"
@export var require_key: bool = false
@export var require_key_id: int = 0

@export var animation_player: AnimationPlayer

func _ready() -> void:
	update_promp()
	
func _on_intract(player):
	if require_key and current_state == State.CLOSE:
		if player.has_method("has_item") and not player.has_item(require_key_id):
			print("can t open", player.has_item(require_key_id))
			return
	toggle_objectt()
func toggle_objectt():
	if current_state == State.CLOSE:
		current_state = State.OPEN
		if animation_player and animation_player.has_animation("open"):
			animation_player.play("open")
	else:
		current_state = State.CLOSE
		if animation_player and animation_player.has_animation("close"):
			animation_player.play("close")
	update_promp()

func update_promp():
	intraction_promp = on_promp if current_state == State.CLOSE else off_promp
