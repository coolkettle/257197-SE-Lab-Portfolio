extends Node2D

@onready var main: Node2D = $Main

func _ready() -> void:
	test_timer_start()

func test_timer_start():
	main.start_timer()
	await get_tree().process_frame
	assert(main.get_ticks() > 0)
