class_name Spawner
extends Node2D

@export var spawn_area : Rect2
@export var default_garbage : PackedScene

func spawn_garbage(garbage: PackedScene = null):
	if(garbage == null):
		assert(default_garbage != null, "defau lt_garbage should have been set up in editor")
		garbage = default_garbage
#	var spawn_pos : Vector2 = Vector2(
#		randf_range(position.x - spawn_area.size.x/2, position.x + spawn_area.size.x/2), 
#		randf_range(position.y - spawn_area.size.y/2, position.y + spawn_area.size.y/2))
	var spawn_pos = position
	var instance: Node2D = garbage.instantiate()
	add_child(instance)
#	instance.position = spawn_pos


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_SPACE):
		spawn_garbage()
	pass
