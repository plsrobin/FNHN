extends KinematicBody

#https://vid.puffyan.us/watch?v=YFgrpp1fpOI

var path = []
var path_node = 0

var speed = 10

var roam = true

#all waypoints
var atPos1 = false

#används inte för tillfället
var atPos2 = false

var enemyName = "BaseEnemy"
var playerName = "player"

onready var nav = get_parent()
onready var player = $"../../player"
onready var wp1 = $"../../wp1"
onready var wp2 = $"../../wp2"
func _ready():
	pass

func _physics_process(delta):
	if path_node < path.size():
		var direction = (path[path_node] - global_transform.origin)
		if direction.length() < 1:
			path_node += 1
		else:
			move_and_slide(direction.normalized() * speed, Vector3.UP)
func move_to(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	path_node = 0


func _on_Timer_timeout():
	if !roam:
		move_to(player.global_transform.origin)
	else:
		if !atPos1:
			move_to(wp1.global_transform.origin)
		elif atPos1:
			move_to(wp2.global_transform.origin)


#waypoint 1
func _on_wp1_body_entered(body):
	print("wp1:")
	print("- "+body.name)
	if body.name == enemyName:
		atPos1 = true

#waypoint 2
func _on_wp2_body_entered(body):
	print("wp2:")
	print("- "+body.name)
	if body.name == enemyName:
		atPos1 = false


#player is near enemy
func _on_reaction_body_entered(body):
	print("Enemy reaction: "+body.name)
	if body.name == playerName:
		roam = false


func _on_reaction_body_exited(body):
	print("Enemy lost: "+body.name)
	if body.name == playerName:
		roam = true
