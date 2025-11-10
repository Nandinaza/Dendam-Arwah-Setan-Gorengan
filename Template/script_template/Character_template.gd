extends CharacterBody3D

@export var NamaCharacter: String = ""
@export var SPEED: float = 5.0
@export var JUMP_VELOCITY: float = 4.5

@export var CAMERA_CONTROLER: SpringArm3D

@onready var ray_cast_3d = $SpringArm3D/RayCast3D
@onready var current_intractable: Intractable = null

var player_inventory: Dictionary = {}
@onready var press_to_intract: Label = $Control/CenterContainer/MarginContainer/press_to_intract

var _mouse_input :bool = false
var _mouse_rotation :Vector3
var _rotation_input :float
var _tilt_input :float

var _player_rotation :Vector3
var _camera_rotation :Vector3
var _current_rotation: float

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if event.is_action_pressed("ui_end"):
		pass
		#intract()

func _unhandled_input(event):
	_mouse_input = event is InputEventMouseMotion
	if _mouse_input:
		_rotation_input = event.relative.x * 0.3 #sensitifity
		_tilt_input = event.relative.y * 0.1
		
	#Intect item
	#var area = ray_cast_3d.get_collider()
	#if area and ray_cast_3d.collide_with_areas and Input.is_action_just_pressed("intract"):
		#
		#match area.name:
			#"kunci_rumah":
				#print("ketem")
			#"Exit_area":
				#print(exp(90))

func update_camera(del):
	
	_current_rotation = _rotation_input
	
	_mouse_rotation.x += _tilt_input * del
	_mouse_rotation.x = clamp(_mouse_rotation.x, deg_to_rad(-90), deg_to_rad(90))
	_mouse_rotation.y += _rotation_input * del
	
	_player_rotation = Vector3(0.0, -_mouse_rotation.y, 0.0)
	_camera_rotation = Vector3(_mouse_rotation.x, 0.0, 0.0)
	
	CAMERA_CONTROLER.transform.basis = Basis.from_euler(_camera_rotation)
	CAMERA_CONTROLER.rotation.z = 0.0
	
	global_transform.basis = Basis.from_euler(_player_rotation )
	
	_rotation_input = 0.0
	_tilt_input = 0.0
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	ray_cast_3d.collide_with_bodies = false
	press_to_intract.hide()
	
func _physics_process(delta):
	check_for_intractable()
	if Input.is_action_just_pressed("intract") and current_intractable:
		current_intractable.intract(self)
		press_to_intract.hide()
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	update_camera(delta)
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func check_for_intractable():
	if ray_cast_3d.is_colliding():
		var collider = ray_cast_3d.get_collider()
		
		#check if its Intractable class
		var interactable = intractable_test(collider)
		#press_to_intract.text = interactable
		
		if interactable != current_intractable:
			if current_intractable:
				_on_intractable_lost(current_intractable)
			current_intractable = interactable
			if current_intractable:
				_on_intractable_found(current_intractable)
	else:
		if current_intractable:
			_on_intractable_lost(current_intractable)
			current_intractable = null
func intractable_test(node):
	if node is Intractable: return node
	
func _on_intractable_lost(intractable: Intractable):
	press_to_intract.text = intractable.get_promp()
	press_to_intract.hide()
func _on_intractable_found(intractable: Intractable):
	press_to_intract.text = intractable.get_promp()
	press_to_intract.show()
	
func add_to_inventory(item_name: String, id: int):
	player_inventory[str(id)] = item_name
func has_item(id: int):
	return player_inventory.has(str(id))
func remove_item(id: int):
	player_inventory.erase(str(id))
