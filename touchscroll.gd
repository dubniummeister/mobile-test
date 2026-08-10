extends ScrollContainer

var dragging := false
var drag_start_y := 0.0
var scroll_start := 0

# Called when the node enters the scene tree for the first time.
func _gui_input(event: InputEvent) -> void:
	if event is InputEventScreenTouch or (event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT):
		if event.pressed:
			dragging = true
			drag_start_y = event.position.y
			scroll_start = scroll_vertical
		else:
			dragging = false
	
	elif dragging and (event is InputEventScreenDrag or event is InputEventMouseMotion):
		var pos: Vector2 = (event as InputEventMouseMotion).position if event is InputEventMouseMotion else (event as InputEventScreenDrag).position
		var delta_y : float = pos.y - drag_start_y
		scroll_vertical = scroll_start - int(delta_y)
