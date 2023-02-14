extends KinematicBody2D

var velocity=Vector2.ZERO
var initial_speed=40
var health=1
var score=10

func _ready():
	velocity = Vector2(0,initial_speed*randf()).rotated(PI*2*randf())

func _physics_process(delta):
	position+=velocity*delta
	position.x=wrapf(position.x,0.0,Global.VP.x)
	position.y=wrapf(position.y,0.0,Global.VP.y)
	
func damage(d):
	health-=d
	if health<=0:
		Global.update_score(score)
		queue_free()
