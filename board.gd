@tool
extends Node2D

@export var width := 7 : set = set_width
@export var height := 7 : set = set_height
@export var cell_size := 100 : set = set_cell_size
@export var cell_scene : PackedScene

func set_width(v):
	width = v
	redraw()
	
func set_height(v):
	height = v
	redraw()
	
func set_cell_size(v):
	cell_size = v
	redraw()
	
func redraw():
	for child in get_children():
		child.queue_free()
		
	for col in width:
		for row in height:
			var cell = cell_scene.instantiate()
			cell.set_size(cell_size)
			cell.set_odd((row+col)%2==1)
			cell.position = Vector2(col*cell_size, row*cell_size)
			add_child(cell)

func _ready():
	redraw()

func place_piece(piece, col, row):
	piece.global_position = global_position + Vector2((col-0.5)*cell_size,(height-row+0.5)*cell_size)

func _input(event):
	if (event is InputEventMouseButton and event.is_released()):
		var col = floor((event.position.x-global_position.x)/cell_size)+1
		var row = height - floor((event.position.y-global_position.y)/cell_size)
		if col >= 1 and row >= 1 and col <= width and row <= height:
			Events.release_on_cell.emit(col, row)
