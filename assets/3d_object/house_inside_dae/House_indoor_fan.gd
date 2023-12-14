extends Spatial

onready var twenn = $Tween
onready var pintu21 = $RootNode/pintu_kecil/Panel002
onready var pintu22 = $RootNode/pintu_kecil001/Panel003
onready var jendela = [
	$"RootNode/Reference003/Window/Window Panel001",
	$"RootNode/Reference003/Window/Window Panel"
]

const ROTATION_DURATION = 0.5
const ROTATION_ANGLE_OPEN = 90
const ROTATION_ANGLE_CLOSE = 0

func _ready():
	pintu21.rotation_degrees.z = deg2rad(0)

func _interpolate_rotation(node, start_angle, end_angle):
	twenn.interpolate_property(
		node, "rotation_degrees",
		Vector3(0, 0, start_angle),
		Vector3(0, 0, end_angle),
		ROTATION_DURATION,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN
	)
	twenn.start()

func _on_Area_body_entered(_body):
	_interpolate_rotation(pintu21, ROTATION_ANGLE_CLOSE, ROTATION_ANGLE_OPEN)

func _on_Area_body_exited(_body):
	_interpolate_rotation(pintu21, ROTATION_ANGLE_OPEN, ROTATION_ANGLE_CLOSE)

func _on_Area_body_entered22(_body):
	_interpolate_rotation(pintu22, ROTATION_ANGLE_CLOSE, ROTATION_ANGLE_OPEN)

func _on_Area_body_exited22(_body):
	_interpolate_rotation(pintu22, ROTATION_ANGLE_OPEN, ROTATION_ANGLE_CLOSE)

func _on_Area_body_entered_jendela(_body):
	_interpolate_rotation(jendela[0], ROTATION_ANGLE_CLOSE, ROTATION_ANGLE_OPEN)
	_interpolate_rotation(jendela[1], ROTATION_ANGLE_CLOSE, -ROTATION_ANGLE_OPEN)

func _on_Area_body_exited_jendela(_body):
	_interpolate_rotation(jendela[0], ROTATION_ANGLE_OPEN, ROTATION_ANGLE_CLOSE)
	_interpolate_rotation(jendela[1], -ROTATION_ANGLE_OPEN, ROTATION_ANGLE_CLOSE)


func _on_Area55_body_entered(body):
	if body.name == "KinematicBody":
		body.on_stair(true)


func _on_Area55_body_exited(body):
	if body.name == "KinematicBody":
		body.on_stair(false)
