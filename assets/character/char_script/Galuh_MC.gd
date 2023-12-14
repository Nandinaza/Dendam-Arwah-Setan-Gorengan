extends KinematicBody

var velocity = Vector3.ZERO
var speed = 14
var stk
var kecepatan_jatuh = 10

func _ready():
	#if Pergerakan.nama_os == "Android":
	stk = get_parent().get_node("HBoxContainer/Sprite/TouchScreenButton")
	

func _physics_process(_delta):
	
	if Pergerakan.nama_os == "Windows":
		velocity = Pergerakan.gerak(velocity,speed)
	else:
		velocity.x = stk.get_value().x * speed
		velocity.z = stk.get_value().y * speed
		
	velocity = (velocity.x * transform.basis.x) + (velocity.z * transform.basis.z)
	velocity.y -= kecepatan_jatuh
	var kecepatan = velocity * 0.5
	var nan = move_and_slide(kecepatan,Vector3.UP)
	
func _input(event):
	if OS.get_name() == "Windows": #or "Android":
		if(event is InputEventMouseMotion):
			self.rotate_y(event.relative.x * 0.007)
			#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	if OS.get_name() == "Android": #Android
		if(event is InputEventScreenDrag and event.position.x > 400):
			self.rotate_y(event.relative.x * -0.01)
	if OS.get_name() == "X11": #Android
		if(event is InputEventScreenDrag and event.position.x > 400):
			self.rotate_y(event.relative.x * -0.01)
			#self.rotate_x(event.relative.y * -0.01)
			
		self.rotation_degrees.z = 0
		#$SpringArm.rotation.y = clamp($SpringArm.rotation.y,deg2rad(-60),deg2rad(60))
	#if event is InputEventMouseMotion:
	#	$SpringArm.rotate_y(event.relative.x * 0.01)


