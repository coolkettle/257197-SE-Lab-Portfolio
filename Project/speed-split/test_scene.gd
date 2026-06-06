extends Node2D

const MAIN = preload("uid://b6q4d3vsu6ry8")

var timer: Node2D

func _ready() -> void:
	test_timer_start()
	test_timer_precision()
	test_timer_stops()
	test_timer_splits()
	test_export_timer_to_csv()

func create_new_timer() -> void:
	if timer:
		timer.free()
	timer = MAIN.instantiate()
	add_child(timer)

func test_timer_start() -> void:
	create_new_timer()
	timer.start_timer()
	await get_tree().physics_frame
	assert(timer.get_ticks() > 0, "Timer didn't start!")

func test_timer_precision() -> void:
	create_new_timer()
	var start_timestamp: int = Time.get_ticks_usec()
	timer.start_timer()
	
	while Time.get_ticks_usec() - start_timestamp < 1000000:
		pass
	print(timer.get_ticks())
	assert(abs(timer.get_ticks() - 1000000) < 1000, "Timer is more than 1ms imprecise!")
	
func test_timer_stops() -> void:
	create_new_timer()
	timer.start_timer()
	await get_tree().physics_frame
	timer.stop_timer()
	var time_1 = timer.get_ticks()
	await get_tree().physics_frame
	var time_2 = timer.get_ticks()
	assert(time_1 == time_2, "Timer didnt stop")

func test_timer_splits() -> void:
	create_new_timer()
	timer.start_timer()
	await get_tree().physics_frame
	timer.add_split()
	await get_tree().physics_frame
	timer.add_split()
	await get_tree().physics_frame
	assert(timer.splits.size() == 2, "Splits were not created")
	
func test_export_timer_to_csv() -> void:
	create_new_timer()
	timer.start_timer()
	await get_tree().physics_frame
	timer.add_split()
	await get_tree().physics_frame
	timer.add_split()
	timer.stop_timer()
	var file: FileAccess = timer.export_to_csv("testfile.csv")
	assert(not file.get_as_text().is_empty(), "file is empty ")
	
