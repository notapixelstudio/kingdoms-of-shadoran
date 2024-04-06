@tool
extends Node2D


func set_size(size):
	%Rect.size = Vector2(size,size)

func set_odd(odd):
	if odd:
		%Rect.modulate = Color(0.8,0.8,0.8)
