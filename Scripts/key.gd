extends RigidBody

func _ready():
	var door = get_tree().get_root().find_node("medievaldoor-locked",true,false)
	print(door)
	door.connect("doorOpen", self, "delete")

func delete():
	queue_free()
