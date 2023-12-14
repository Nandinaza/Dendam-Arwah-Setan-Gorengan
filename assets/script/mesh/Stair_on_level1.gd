extends Area

func _on_Area_body_entered(body):
	if body.name == "KinematicBody":
		body.kecepatan_jatuh = 2


func _on_Area_body_exited(body):
	if body.name == "KinematicBody":
		body.kecepatan_jatuh = 10
