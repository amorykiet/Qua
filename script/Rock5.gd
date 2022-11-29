extends KinematicBody2D

var falling:= false
var velocity:= Vector2.DOWN*100

func _physics_process(delta):
	if falling:
		move_and_collide(velocity*delta)

func start_falling():
	if not falling:
		$FallingSound.play()
		falling = true

func reset():
	falling = false
