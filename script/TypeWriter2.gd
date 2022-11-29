extends Control

var text_list = [
	"It's done",
	"Thank you for playing",
	"I'm so happy you're still here",
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
