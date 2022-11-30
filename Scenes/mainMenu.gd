extends Control

func _ready():
	$CenterContainer/VBoxContainer/Start.grab_focus()

func _on_Quit_pressed():
	get_tree().quit()


func _on_Start_pressed():
	get_tree().change_scene("res://Scenes/main.tscn")
