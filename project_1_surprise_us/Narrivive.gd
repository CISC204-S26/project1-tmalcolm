extends Label
@export var lines = []
@export var line_end = 0
@export var nextscene = ""
@export var new_text : String
@export var wait_time : float
var current_line = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Input.is_action_just_pressed("Next"):
		current_line = current_line + 1
		text = lines[current_line]
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
