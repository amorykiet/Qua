extends Control

func _ready():
	$Music.play()
	$AnimationPlayer.play("backing")
	$"%Label2".text = String(Death.death_time)


func _on_RestartButton_pressed():
	get_tree().change_scene("res://TitleScreen.tscn")
