extends Node2D

@onready var label: Label = %Label
var start_timestamp: int
var current_timestamp: int

func start_timer() -> void:
	start_timestamp = Time.get_ticks_usec()

func get_ticks() -> int:
	return Time.get_ticks_usec() - start_timestamp

func _ready() -> void:
	start_timestamp = Time.get_ticks_usec()

#func _process(delta: float) -> void:
	#current_timestamp = Time.get_ticks_usec()
	#label.text = str(current_timestamp)
