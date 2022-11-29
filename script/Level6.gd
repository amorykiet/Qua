extends Level

func reset():
	get_tree().call_group("events","reset")
