extends Area

func _input(event):
#	print(len(get_overlapping_bodies()))
	if len(get_overlapping_bodies()) > 0:
		$Control.show()
		$Control.show_intract(true)
		if event.is_action_pressed("ui_accept"):
			$Control.and_show(true)
			$Control.load_dialog(Indonesian.penanda)
	else:
		$Control.show_intract(false)
		$Control.hide()

