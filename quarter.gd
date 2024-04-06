@tool
extends Node2D


func set_size(width, height):
	%Rect.size = Vector2(width,height)
	%Line2D.points = PackedVector2Array([
		Vector2(0,0),
		Vector2(width,0),
		Vector2(width,height),
		Vector2(0,height)
	])
