extends Control

func _ready():
	$Music.play()
	$TypeWriter.show()
	$TitleText.hide()
	$StartButton.hide()
	$StartButton.disabled = true
	$SkipButton.show()
	$SkipButton.disabled = false
	$AnimationPlayer.play("intro")
func change():
	get_tree().change_scene("res://Game.tscn")


func _on_StartButton_pressed():
	$AnimationPlayer.play("press_start")

func ready_to_play():
	$AnimationPlayer.play("RESET")
