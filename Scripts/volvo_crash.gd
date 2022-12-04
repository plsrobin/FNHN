extends StaticBody
#var door_state = false

var animation_played = false

func interact():
	if !animation_played:
		$AnimationPlayer.play("volvo_crash")
		animation_played = true
		print("interact")
