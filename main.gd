extends Node2D

@export var piece_scene : PackedScene

func _ready():
	Events.drag_started.connect(_on_drag_started)
	Events.drag_ended.connect(_on_drag_ended)
	Events.release_on_cell.connect(_on_release_on_cell)
	
	# place kings on the board
	var king = piece_scene.instantiate()
	add_child(king)
	%Board.place_piece(king, 4, 1)
	
	var king_oppo = piece_scene.instantiate()
	king_oppo.set_opponent()
	add_child(king_oppo)
	%Board.place_piece(king_oppo, 4, 7)

var dragged_piece : Piece

func _on_drag_started(piece:Piece):
	print('Drag started for piece: %s' % piece.name)
	dragged_piece = piece
	
func _on_drag_ended(piece:Piece):
	print('Drag ended for piece: %s' % piece.name)
	reset_drag.call_deferred()
	
func reset_drag():
	dragged_piece = null

func _on_release_on_cell(col:int, row:int):
	print('Release on cell (%d, %d)' % [col, row])
	if dragged_piece != null:
		%Board.place_piece(dragged_piece, col, row)
