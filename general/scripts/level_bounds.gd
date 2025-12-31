@tool
@icon("res://general/icons/level_bounds.svg")
class_name LevelBounds extends Node

@export_range(480, 2048, 32, "suffix:px") var width : int = 480
@export_range(270, 2048, 32, "suffix:px") var height : int = 270


func _ready() -> void:
	# Handle z-index
	# Check for and get reference to our camera
	# Update camera's limits
	pass



func _draw() -> void:
	if Engine.is_editor_hint():
		# draw a box
		var r : Rect2 = Rect2(Vector2.ZERO, Vector2(width, height))
	pass
