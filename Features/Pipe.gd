class_name Pipe
extends Node2D

# Export variables
@export_range(0.01, 1) var tween_durations : float = 0.05

# Onready vars
@onready var left_blocker = $PipeLeftBlocker
@onready var right_blocker = $PipeRightBlocker

# Controlling pipe flow
func _input(event):
	if event.is_action_type():
		var tween = create_tween()
		if event.is_action_pressed("BlockLeft"):
			left_blocker.show()
			left_blocker.set_process(true)
			left_blocker.modulate = Color.TRANSPARENT
			tween.tween_property(left_blocker, "modulate", Color.WHITE, tween_durations)
		elif event.is_action_released("BlockLeft"):
			left_blocker.set_process(false)
			left_blocker.modulate = Color.WHITE
			tween.tween_property(left_blocker, "modulate", Color.TRANSPARENT, tween_durations)
			tween.tween_callback(left_blocker.hide)
		elif event.is_action_pressed("BlockRight"):
			right_blocker.show()
			right_blocker.set_process(true)
			right_blocker.modulate = Color.TRANSPARENT
			tween.tween_property(right_blocker, "modulate", Color.WHITE, tween_durations)
		elif event.is_action_released("BlockRight"):
			right_blocker.set_process(false)
			right_blocker.modulate = Color.WHITE
			tween.tween_property(right_blocker, "modulate", Color.TRANSPARENT, tween_durations)
			tween.tween_callback(right_blocker.hide)
