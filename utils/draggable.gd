#bytemyke source code for https://www.youtube.com/watch?v=neZ9tLVUDk4&feature=youtu.be
extends Sprite2D
class_name Draggable

var is_dragging = false #state management
var mouse_offset #center mouse on click
var delay = 0.2
var drag_copy

func _process(delta):
	if is_dragging == true:
		var tween = get_tree().create_tween()
		tween.tween_property(drag_copy, "global_position", get_global_mouse_position()-mouse_offset, delay)

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.is_pressed():
			if get_rect().has_point(to_local(event.global_position)):
				is_dragging = true
				Events.drag_started.emit(self)
				mouse_offset = get_global_mouse_position()-global_position
				drag_copy = Sprite2D.new()
				add_child(drag_copy)
				drag_copy.texture = texture
				self_modulate = Color(1,1,1,0.4)
		else:
			if is_dragging:
				drag_copy.queue_free()
				self_modulate = Color(1,1,1,1)
				Events.drag_ended.emit(self)
			is_dragging = false
			
