extends Area2D
signal in_area_checkpoint(checkpoint_position)

func _on_Checkpointarea_area_entered(area):
	emit_signal("in_area_checkpoint",$CheckpointPosition.global_position)
