extends Control

@onready var mainmenu = $Mainmenu
@onready var settings_menu = $Settings_menu
@onready var audio_stream_player = $Click_sound
@onready var blank = $Blank
@onready var hover_sound = $Hover_sound
@onready var background_music = $Background_Music

@onready var gpu_particles_3d: GPUParticles3D = $SubViewportContainer/SubViewport/Node3D/GPUParticles3D

#wiggle camera
@onready var camera_viewport: Camera3D = $SubViewportContainer/SubViewport/Node3D/Camera3D
var a = 0.0

@export var setting_vr: settings

func _ready():
	mainmenu.visible = true
	settings_menu.visible = false
	blank.visible = false
	
	audio_stream_player.volume_db = setting_vr.sound_effect
	hover_sound.volume_db = setting_vr.sound_effect
	background_music.volume_db = setting_vr.background_music
	
	gpu_particles_3d.emitting = true

func _process(delta: float) -> void:
	a += delta
	#-3.41 2.352 -13.952
	camera_viewport.position.y = 2 + (sin(a) * 0.2)

func setting_toggle():
	audio_stream_player.play()
	mainmenu.visible = not mainmenu.visible
	settings_menu.visible = not settings_menu.visible

#Button Pressed
func _on_play_button_pressed():
	audio_stream_player.play()
	get_tree().change_scene_to_file("res://Main_story/Prologue_0/Ulang_tahun_pito.tscn")
func _on_setting_button_pressed():
	setting_toggle()
func _on_exit_button_pressed():
	audio_stream_player.play()
	blank.visible = true
	await get_tree().create_timer(0.5).timeout
	get_tree().quit()

#back button
func _on_back_pressed():
	setting_toggle()

		
func _on_check_box_2_pressed():
	audio_stream_player.play()
func _on_option_language_item_selected(_index):
	audio_stream_player.play()
func _on_option_language_pressed():
	audio_stream_player.play()


func _on_check_box_mouse_entered():
	hover_sound.play()
func _on_back_mouse_entered():
	hover_sound.play()
func _on_option_language_mouse_entered():
	hover_sound.play()
func _on_check_box_2_mouse_entered():
	hover_sound.play()
func _on_play_button_mouse_entered():
	hover_sound.play()
func _on_setting_button_mouse_entered():
	hover_sound.play()
func _on_exit_button_mouse_entered():
	hover_sound.play()


func _on_bgm_value_changed(value):
	background_music.volume_db = value
func _on_sfx_value_changed(value):
	audio_stream_player.volume_db = value
	hover_sound.volume_db = value


func _on_background_music_finished():
	background_music.play()
