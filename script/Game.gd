extends Node2D
var open_hud: bool = false
var death_score: int = 0

func _ready():
	$CaveSound.play()
	Death.death_time = death_score
	$"%Label2".text = String(death_score)

func _physics_process(delta):
	if Input.is_action_just_pressed("quit") and not open_hud:
		$Cameraman/HUD.show()
		open_hud = true
		get_tree().paused = true
	elif Input.is_action_just_pressed("quit") and open_hud:
		$Cameraman/HUD.hide()
		open_hud = false
		get_tree().paused = false
	
	if Input.is_action_just_pressed("replay"):
		reload_game()

func reload_game():
	get_tree().call_group("levels","reset")

	if Checkpoint.player_last_position:
		$Qua.position = Checkpoint.player_last_position
		$Cameraman.position = Checkpoint.camera_last_position
		$Qua.revive()

#checkpoint code
func to_checkpoint(level_emitting, checkpoint_position, camera_position):
	$DelayToFlyTime.stop()
	if Checkpoint.current_level != level_emitting:
		Checkpoint.player_last_position = checkpoint_position
		Checkpoint.camera_last_position = camera_position
		var tween:= create_tween()
		tween.tween_property($"%Cameraman","global_position",camera_position,0.5)
		$"%Qua".stop = true
		$DelayToFlyTime.start()
		Checkpoint.current_level = level_emitting

func finish_delay_to_fly():
	$"%Qua".stop = false
#finish ceckpoint code

func _on_FinishArea_body_entered(body):
	get_tree().change_scene("res://FinishScreen.tscn")


func _on_FinishArea_area_entered(area):
	get_tree().change_scene("res://FinishScreen.tscn")


func _on_Qua_body_entered(body):
	death_score += 1
	Death.death_time = death_score
	$"%Label2".text = String(death_score)
