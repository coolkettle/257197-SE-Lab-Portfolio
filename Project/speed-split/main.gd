extends Node2D

@onready var label: Label = %Label
var start_timestamp: int
var current_timestamp: int
var stop_timestamp: int
var stopped: bool = false

func start_timer() -> void:
	stopped = false
	start_timestamp = Time.get_ticks_usec()

func get_ticks() -> int:
	if not stopped:
		return Time.get_ticks_usec() - start_timestamp
	return stop_timestamp - start_timestamp

func _ready() -> void:
	start_timestamp = Time.get_ticks_usec()

func stop_timer() -> void:
	stopped = true
	stop_timestamp = Time.get_ticks_usec()

#func _process(delta: float) -> void:
	#current_timestamp = Time.get_ticks_usec()
	#label.text = str(current_timestamp)
