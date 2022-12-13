extends Node

var Volume = 50

func _ready():
	pass 


func _process(delta):
	if Input.is_action_just_pressed("fullscreen_toggle") and OS.window_fullscreen == true:
		OS.window_fullscreen = false
		
	elif Input.is_action_just_pressed("fullscreen_toggle") and OS.window_fullscreen == false:
		OS.window_fullscreen = true
