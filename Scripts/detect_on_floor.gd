extends Area


func _on_Area_body_entered(body):
	print(body.name+" entered the floor")


func _on_Area_body_exited(body):
	print(body.name+" left the floor")
