extends KinematicBody2D

onready var Enemy_Shooting=load("res://Effects/Enemy_Shooting.tscn")
onready var Enemy_Bullet=load("res://Enemy/Enemy_Bullet.tscn")
var nose=Vector2(0,-60)
var health=5
var score=50

func _ready():
	pass


func damage(d):
	health-=d
	if health<=0:
		Global.update_score(score)
		queue_free()

func _on_Timer_timeout():
	var Player=get_node_or_null("/root/Game/Player_Container/Player")
	var Effects=get_node_or_null("/root/Game/Effects")
	if Player!=null and Effects!=null:
		var dir=global_position.angle_to_point(Player.global_position)-PI/2
		var enemy_bullet=Enemy_Bullet.instance()
		enemy_bullet.global_position=global_position+nose.rotated(dir)
		enemy_bullet.rotation=dir
		Effects.add_child(enemy_bullet)
		var shooting_face=Enemy_Shooting.instance()
		Effects.add_child(shooting_face)
		shooting_face.rotation=rotation
		shooting_face.global_position=global_position
