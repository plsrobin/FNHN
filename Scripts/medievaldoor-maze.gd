extends StaticBody
var door_state = false
var closed = false

	
func interact():
		open_and_close()
			
func open_and_close():
	if not $AnimationPlayer.is_playing():
		door_state  = !door_state 
	if door_state and !closed:
		$AnimationPlayer.play("doorOpen")
		closed = true

func _on_closeArea_body_entered(body):
	if door_state:
		$AnimationPlayer.play("doorClose")
		door_state  = !door_state 
