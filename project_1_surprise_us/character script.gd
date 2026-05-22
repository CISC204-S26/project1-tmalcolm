extends Node2D

@onready var character = $Character
@onready var normal = $Normal
@onready var nervous = $Nervous
@onready var surprise = $Surprise
@onready var afraid = $Afraid
@onready var insane = $Insane

func set_expression(face):
	normal.hide()
	nervous.hide()
	surprise.hide()
	afraid.hide()
	insane.hide()

	match face:
		"normal":
			normal.show()
		"nervous":
			nervous.show()
		"surprise":
			surprise.show()
		"afraid":
			afraid.show()
		"insane":
			insane.show()

func _ready():
	set_expression("normal")
