extends Draggable
class_name Piece

@export var _piece_type : PieceType
var _opponent : bool = false

func set_piece_type(v:PieceType):
	_piece_type = v
	redraw()

func set_opponent(v:bool=true):
	_opponent = v
	redraw()
	
func _ready():
	redraw()

func redraw():
	if _opponent:
		texture = _piece_type.texture_opponent
	else:
		texture = _piece_type.texture
