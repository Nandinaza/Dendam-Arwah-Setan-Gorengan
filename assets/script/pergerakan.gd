extends Node

var nama_os

func _ready():
	nama_os = OS.get_name()

func gerak(velocity,speed):
	if(Input.is_action_pressed("ui_up")):
		velocity.z -= speed
	if(Input.is_action_pressed("ui_down")):
		velocity.z += speed
	if(Input.is_action_pressed("ui_right")):
		velocity.x += speed
	if(Input.is_action_pressed("ui_left")):
		velocity.x -= speed
	return velocity

func kamera_android():
	pass
	
func kamera_pc():
	pass
