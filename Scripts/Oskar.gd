extends KinematicBody

#https://vid.puffyan.us/watch?v=YFgrpp1fpOI

var path = []
var path_node = 0

var speed = 5
var turnSpeed = 8

var roam = true
var sound = true
var isMoving = true
var isMovingStrength = 0
var walking = false

#all waypoints
var atPos1 = false
var atPos2 = true
var atPos3 = true
var atPos4 = true

var enemyName = "Oskar"
var playerName = "player"
var soundDirection = null
var targetPos = null
var previous_position = global_transform.origin

onready var nav = get_parent()
onready var player = $"../../player"
onready var wp = get_tree().get_nodes_in_group("waypoint")
onready var fakeEyes = $FakeEyes

func _ready():
	pass

func _physics_process(delta):
	if !isMoving:
		sound = false
	
	if path_node < path.size():
		var direction = (path[path_node] - global_transform.origin)
		if direction.length() < 1:
			path_node += 1
		else:
			move_and_slide(direction.normalized() * speed, Vector3.UP)
			fakeEyes.look_at(targetPos, Vector3.UP)
			rotate_y(deg2rad(fakeEyes.rotation.y * turnSpeed))
	is_moving()


func is_moving():
	if global_transform.origin != previous_position:
		isMoving = true
	elif isMovingStrength > 60:
		isMoving = false
		isMovingStrength = 0
	else:
		isMovingStrength += 1
	previous_position = global_transform.origin
			
func move_to(target_pos):
	targetPos = target_pos
	path = nav.get_simple_path(global_transform.origin, target_pos)
	path_node = 0

func _on_Timer_timeout():
	if !roam:
		move_to(player.global_transform.origin)
	elif sound:
		move_to(soundDirection)
	elif !sound and roam:
		if	!atPos1:
			move_to(wp[0].global_transform.origin)
		elif !atPos2:
			move_to(wp[1].global_transform.origin)
		elif !atPos3:
			move_to(wp[2].global_transform.origin)
		elif !atPos4:
			move_to(wp[3].global_transform.origin)
			
func _on_Floor_body_entered(body):
	sound = true
	soundDirection = body.global_transform.origin

func _on_Floor_body_exited(body):
	pass

func _on_Eyes_body_entered(body):
	print("Enemy reaction: "+body.name)
	if body.name == playerName:
		roam = false

func _on_Eyes_body_exited(body):
	print("Enemy lost: "+body.name)
	if body.name == playerName:
		roam = true

func _on_wp1_body_entered(body):
	if body.name == enemyName:
		atPos1 = true
		atPos2 = false

func _on_wp2_body_entered(body):
	if body.name == enemyName:
		atPos2 = true
		atPos3 = false

func _on_wp3_body_entered(body):
	if body.name == enemyName:
		atPos3 = true
		atPos4 = false

func _on_wp4_body_entered(body):
	if body.name == enemyName:
		atPos4 = true
		atPos1 = false
