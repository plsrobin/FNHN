extends RigidBody

func _ready():
	var door = get_tree().get_root().find_node("door_volvo",true,false)
	print(door)
	door.connect("doorOpen", self, "delete")

func delete():
	queue_free()
