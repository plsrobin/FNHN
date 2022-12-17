extends Spatial
var door_state = false
signal doorOpen()

func interact():
	pass

func open_and_close():
	pass

func _on_Area_body_entered(body):
	if body.is_in_group("crowbar"):
		emit_signal("doorOpen")
		door_state  = !door_state 
		open_and_close()
	elif door_state == false:
		print("Du behöver en kofot")
