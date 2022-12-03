extends Spatial
var door_state = false
signal doorOpen()

func open_and_close():	
	if door_state:
		$StaticBody/AnimationPlayer.play("doorOpen")

func _on_Area_body_entered(body):
	if body.is_in_group("key"):
		emit_signal("doorOpen")
		door_state  = !door_state 
		open_and_close()
	elif door_state == false:
		print("Du behöver en nyckel")

func _on_Closearea_body_entered(body):
	if door_state:
		$StaticBody/AnimationPlayer.play("doorClose")
		door_state  = !door_state 
