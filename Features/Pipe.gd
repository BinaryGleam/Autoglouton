class_name Pipe
extends Node2D

# Onready vars
@onready var LeftBlocker = $PipeLeftBlocker
@onready var RightBlocker = $PipeRightBlocker

# Controlling pipe flow
func _input(event):
	if event.is_action_pressed("BlockLeft"):
		LeftBlocker.show()
	if event.is_action_released("BlockLeft"):
		LeftBlocker.hide()
	if event.is_action_pressed("BlockRight"):
		RightBlocker.show()
	if event.is_action_released("BlockRight"):
		RightBlocker.hide()
