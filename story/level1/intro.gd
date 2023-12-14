extends Spatial

func _on_message_body_exited(body):
	if body.name == "KinematicBody":
		var p = get_node("message/Control")
		p.and_show(false)

func _on_message_body_entered(body):
	if body.name == "KinematicBody":
		var p = get_node("message/Control")




func _on_juru_kunci_body_entered(body):
	if body.name == "KinematicBody":
		var p = get_node("juru kunci/Control")


func _on_juru_kunci_body_exited(body):
	if body.name == "KinematicBody":
		var p = get_node("juru kunci/Control")
		p.and_show(false)
