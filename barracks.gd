@tool
extends Node2D

@export var width := 7 : set = set_width
@export var height := 2 : set = set_height
@export var quarter_width := 80 : set = set_quarter_width
@export var quarter_height := 110 : set = set_quarter_height
@export var quarter_scene : PackedScene

func set_width(v):
	width = v
	redraw()
	
func set_height(v):
	height = v
	redraw()
	
func set_quarter_width(v):
	quarter_width = v
	redraw()
	
func set_quarter_height(v):
	quarter_height = v
	redraw()
	
func redraw():
	for child in get_children():
		child.queue_free()
		
	for col in width:
		for row in height:
			var quarter = quarter_scene.instantiate()
			quarter.set_size(quarter_width,quarter_height)
			quarter.position = Vector2(col*quarter_width, row*quarter_height)
			add_child(quarter)

func _ready():
	redraw()
