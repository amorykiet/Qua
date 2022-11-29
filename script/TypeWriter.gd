extends Control

var text_list = [
	"Death is everywhere",
	"I'm alone in this hell",
	"I have to go back",
	"No matter how many deaths"
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
