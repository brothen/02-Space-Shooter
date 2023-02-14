extends KinematicBody2D

var velocity=Vector2.ZERO
var speed=5
var max_speed=400
var rot_speed=5


func _physics_process(_delta):
	velocity+=get_input()*speed
	velocity=velocity.normalized()*clamp(velocity.length(),0,max_speed)
	velocity=move_and_slide(velocity,Vector2.ZERO)
	position.x=wrapf(position.x,0.0,Global.VP.x)
	position.y=wrapf(position.y,0.0,Global.VP.y)
	
func get_input():
	var dir=Vector2.ZERO
	if Input.is_action_pressed("up"):
		dir+=Vector2(0,-1)
	if Input.is_action_pressed("left"):
		rotation_degrees-=rot_speed
	if Input.is_action_pressed("right"):
		rotation_degrees+=rot_speed
	return dir.rotated(rotation)

func _on_Timer_timeout():
	queue_free()
