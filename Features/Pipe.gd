class_name Pipe
extends Node2D

# Export variables
@export_range(0.01, 1) var tween_durations : float = 0.05

# Onready vars
@onready var left_blocker = $PipeLeftBlocker
@onready var left_blocker_collision = $PipeLeftBlocker/Area2D/Blocker
@onready var right_blocker = $PipeRightBlocker
@onready var right_blocker_collision = $PipeRightBlocker/Area2D/Blocker


# Controlling pipe flow
func _input(event):
	# Doing a bunch of create tween in order to avoid errors
	if event.is_action_pressed("BlockLeft"):
		var tween = create_tween()
		left_blocker.show()
		left_blocker_collision.disabled = false;
		left_blocker.modulate = Color.TRANSPARENT
		tween.tween_property(left_blocker, "modulate", Color.WHITE, tween_durations)
	elif event.is_action_released("BlockLeft"):
		var tween = create_tween()
		left_blocker_collision.disabled = true;
		left_blocker.modulate = Color.WHITE
		tween.tween_property(left_blocker, "modulate", Color.TRANSPARENT, tween_durations)
		tween.tween_callback(left_blocker.hide)
	elif event.is_action_pressed("BlockRight"):
		var tween = create_tween()
		right_blocker.show()
		right_blocker_collision.disabled = false;
		right_blocker.modulate = Color.TRANSPARENT
		tween.tween_property(right_blocker, "modulate", Color.WHITE, tween_durations)
	elif event.is_action_released("BlockRight"):
		var tween = create_tween()
		right_blocker_collision.disabled = true;
		right_blocker.modulate = Color.WHITE
		tween.tween_property(right_blocker, "modulate", Color.TRANSPARENT, tween_durations)
		tween.tween_callback(right_blocker.hide)
