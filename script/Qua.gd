extends Area2D
enum {FLY, DEAD}
var state: int = FLY

signal hit
signal reload_game

var velocity: Vector2 = Vector2.ZERO
var fly_max_speed: = 200
var fly_acce: int = 500
var fiction: int = 250
var stop: bool = false

func _ready():
	revive()

func revive():
	$AnimationPlayer.play("fly")
	$CollisionShape2D.set_deferred("disabled", false)
	state = FLY

func get_movement(delta):
	if Input.is_action_pressed("ui_right"):
		$Sprite.flip_h = false
		$Move_area.position.x = 6
		velocity.x += fly_acce*delta
	elif Input.is_action_pressed("ui_left"):
		$Move_area.position.x = -6
		$Sprite.flip_h = true
		velocity.x -= fly_acce*delta
	if Input.is_action_pressed("ui_up"):
		velocity.y -= fly_acce*delta
	elif Input.is_action_pressed("ui_down"):
		velocity.y += fly_acce*delta
	if velocity.x > 3:
		velocity.x -= fiction*delta
	elif velocity.x < -3:
		velocity.x += fiction*delta
	else:
		velocity.x = 0
	if velocity.y > 6:
		velocity.y -= fiction*delta
	elif velocity.y < 0:
		velocity.y += fiction*delta
	else:
		velocity.y = 6
	if velocity.x > fly_max_speed:
		velocity.x = fly_max_speed
	elif velocity.x < -fly_max_speed:
		velocity.x = -fly_max_speed
	if velocity.y > fly_max_speed:
		velocity.y = fly_max_speed
	elif velocity.y < -fly_max_speed:
		velocity.y = -fly_max_speed
	if stop:
		velocity = Vector2.ZERO

func _physics_process(delta):
	if state == FLY:
		get_movement(delta)
		position += velocity*delta
	elif state == DEAD:
		$CollisionShape2D.set_deferred("disabled", true)
		velocity = Vector2.ZERO

func _on_Qua_hit(body):
	state = DEAD
	$Death_sound.play()
	$AnimationPlayer.play("dead")

func reload_game():
	emit_signal("reload_game")
