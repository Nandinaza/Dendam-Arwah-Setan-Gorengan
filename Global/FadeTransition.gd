extends Control

@onready var animation_player = $AnimationPlayer
@onready var tanggal: Label = $MarginContainer/VBoxContainer/Tanggal
@onready var deskripsi: Label = $MarginContainer/VBoxContainer/deskripsi
#@onready var label: Label = $Label

var dstes = "suatu desa tanpa nama"
signal transition_finished

func _ready() -> void:
	self.visible = false
	transition_finished.connect(is_finish)

func play_fade_in(tanggal_t: String, deskripsi_t: String):
	self.visible = true
	#animation_player.play("fade_in")
	
	var current_char = 0
	var current_char_ = 0
	tanggal.text = ""
	deskripsi.text = ""
	
	await get_tree().create_timer(1).timeout
	for i in tanggal_t.length():
		if current_char < tanggal_t.length():
			tanggal.text += tanggal_t[current_char]
			current_char += 1
		await get_tree().create_timer(0.1).timeout
	for i in deskripsi_t.length():
		if current_char_ < deskripsi_t.length():
			deskripsi.text += deskripsi_t[current_char_]
			current_char_ += 1
		await get_tree().create_timer(0.1).timeout
	await get_tree().create_timer(1).timeout
	
	animation_player.play("fade_in")
	if animation_player.animation_finished:
		emit_signal('transition_finished')
	
func play_fade_out():
	tanggal.text = ""
	deskripsi.text = ""
	animation_player.play("fade_in", -1, 1.0, true)
	if animation_player.animation_finished:
		self.visible = true
	
func is_finish() -> bool:
	return true
	#label.text = text
