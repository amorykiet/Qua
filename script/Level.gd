extends Node2D
class_name Level
signal in_area_checkpoint(level_emitting, checkpoint_position, camera_position)

func reset():
	pass

func in_area_checkpoint(checkpoint_position):
	emit_signal("in_area_checkpoint",name,checkpoint_position,global_position)
