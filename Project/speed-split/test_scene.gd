extends Node2D

@onready var main: Node2D = $Main

func _ready() -> void:
	main.start_timer()
	await get_tree().process_frame
	print(test_timer_start(main.get_ticks()))

func test_timer_start(tick):
	if (tick > 1):
		return true
	return false
