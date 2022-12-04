extends StaticBody
var door_state = false

	
func interact():
	if $AnimationPlayer.is_playing():
		return
	else:
		open_and_close()
			
func open_and_close():
	if not $AnimationPlayer.is_playing():
		door_state  = !door_state 
	if door_state:
		$AnimationPlayer.play("doorOpen")
	else:
		$AnimationPlayer.play("doorClose") 

func _on_closeArea_body_entered(body):
	if door_state:
		$AnimationPlayer.play("doorClose")
		door_state  = !door_state 
