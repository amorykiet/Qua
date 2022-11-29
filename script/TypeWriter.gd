extends Control

var text_list = [
	"They hated you",
	"One of them killed you",
	"But now, open your eyes",
	"And you must..."
]
var count: int = 0

func add_text(text: String):
	$Text.text = text
	$TypeEffect.play("typing")


func _on_Timer_timeout():
	add_text(text_list[count])
	count += 1
	if count == 4:
		$Timer.stop()
