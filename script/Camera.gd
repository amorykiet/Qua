extends Node2D

var positionCamera: Vector2

func _process(delta):
	$Camera2D.global_position = positionCamera
