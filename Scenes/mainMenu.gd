extends Control

func _ready():
	$Main.show()
	$Options.hide()
	OS.window_fullscreen = true
	pass

func _on_Quit_pressed():
	get_tree().quit()


func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/main.tscn")


func _on_Options_pressed():
	$Main.hide()
	$Options.show()
	$Controls.hide()


func _on_Back_pressed():
	$Main.show()
	$Options.hide()
	$Controls.hide()



func _on_Volumeslider_changed():
	Global.Volume = $Options/Volumeslider.value


func _on_Controls_pressed():
	$Main.hide()
	$Options.hide()
	$Controls.show()
