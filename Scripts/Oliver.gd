extends KinematicBody

#https://vid.puffyan.us/watch?v=YFgrpp1fpOI

var path = []
var path_node = 0

var speed = 4

var roam = true
var checkPoint0 = false
var checkPoint1 = false
var checkPoint2 = false
var checkPoint3 = false
var checkPoint4 = false
var checkPoint5 = false
var checkPoint6 = false

#all waypoints
var atPos1 = false
var atPos2 = true
var atPos3 = true
var atPos4 = true
var atPos5 = true
var atPos6 = true
var atPos7 = true
var atPos8 = true
var atPos9 = true
var atPos10 = true

var atPos11 = false
var atPos12 = true
var atPos13 = true
var atPos14 = true
var atPos15 = true
var atPos16 = true

var atTeleport1 = false
var atTeleport2 = true
var atTeleport3 = true

var enemyName = "Oliver"
var playerName = "player"

onready var nav = get_parent()
onready var player = $"../../player"
onready var wp = get_tree().get_nodes_in_group("waypoint")
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
	elif !checkPoint0:
		if !atPos1:
			move_to(wp[0].global_transform.origin)
		elif !atPos2:
			move_to(wp[1].global_transform.origin)
		elif !atPos3:
			move_to(wp[2].global_transform.origin)
		elif atPos3 and atPos2 and atPos1 and !atTeleport1:
			self.translation = Vector3(31.755, 1.26, 3.401)
			atTeleport1 = true
			atPos4 = false
		elif !atPos4:
			move_to(wp[3].global_transform.origin)
		elif !atPos5:
			move_to(wp[4].global_transform.origin)
		elif !atPos6:
			move_to(wp[5].global_transform.origin)
		elif !atPos7:
			move_to(wp[6].global_transform.origin)
			atTeleport2 = false
		elif atPos3 and atPos2 and atPos1 and !atTeleport2:
			self.translation = Vector3(20.509, 1.26, -18.205)
			atTeleport2 = true
			atPos8 = false
		elif !atPos8:
			move_to(wp[7].global_transform.origin)
		elif !atPos9:
			move_to(wp[8].global_transform.origin)
		elif !atPos10:
			move_to(wp[9].global_transform.origin)
			atTeleport3 = false
		elif atPos3 and atPos2 and atPos1 and !atTeleport3:
			self.translation = Vector3(22.163, 1.26, 0)
			atTeleport3 = true
			atPos1 = false
			atTeleport1 = false
	elif checkPoint0:
		if checkPoint1:
			self.translation = Vector3(18.306, 1.26, -41.988)
			checkPoint1 = false
		elif checkPoint2:
			self.translation = Vector3(49.481, 1.26, -32.758)
			checkPoint2= false
		elif checkPoint3:
			self.translation = Vector3(33.988, 1.26, -63.034)
			checkPoint3= false
		elif checkPoint4:
			self.translation = Vector3(54.372, 1.26, -43.508)
			checkPoint4 = false
		elif checkPoint5:
			self.translation = Vector3(106.423, 1.26, -79.63)
			checkPoint5 = false
		elif checkPoint6:
			self.translation = Vector3(32.908, 1.26, -79.462)
			checkPoint6 = false

#player is near enemy
func _on_reaction_body_entered(body):
	if body.name == playerName:
		roam = false

func _on_reaction_body_exited(body):
	if body.name == playerName:
		roam = true
		
#waypoints
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

func _on_wp4_body_entered(body):
	if body.name == enemyName:
		atPos4 = true
		atPos5 = false

func _on_wp5_body_entered(body):
	if body.name == enemyName:
		atPos5 = true
		atPos6 = false

func _on_wp6_body_entered(body):
	if body.name == enemyName:
		atPos6 = true
		atPos7 = false

func _on_wp7_body_entered(body):
	if body.name == enemyName:
		atPos7 = true

func _on_wp8_body_entered(body):
	if body.name == enemyName:
		atPos8 = true
		atPos9 = false

func _on_wp9_body_entered(body):
	if body.name == enemyName:
		atPos9 = true
		atPos10 = false

func _on_wp10_body_entered(body):
	if body.name == enemyName:
		atPos10 = true

func _on_Area_body_entered(body):
	if body.name == playerName:
		checkPoint0 = true
		checkPoint1 = true

func _on_Area2_body_entered(body):
	if body.name == playerName:
		checkPoint1 = false
		checkPoint2 = true

func _on_Area3_body_entered(body):
	if body.name == playerName:
		checkPoint2 = false
		checkPoint3 = true

func _on_Area4_body_entered(body):
	if body.name == playerName:
		checkPoint3 = false
		checkPoint4 = true
		
func _on_Area5_body_entered(body):
	if body.name == playerName:
		checkPoint4 = false
		checkPoint5 = true

func _on_Area6_body_entered(body):
	if body.name == playerName:
		checkPoint5 = false
		checkPoint6 = true
