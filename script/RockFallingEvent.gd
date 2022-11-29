extends Node2D

func start_falling(body):
	$Rock5.start_falling()

func reset():
	$Rock5.global_position = global_position
	$Rock5.reset()
