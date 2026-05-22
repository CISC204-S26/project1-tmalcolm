extends Node2D


@onready var Normal = $Normal
@onready var Nervous = $Nervous
@onready var Surprise = $Surprise
@onready var Afraid = $Afraid
@onready var Insane = $Insane

func set_expression(expression):
	Normal.hide()
	Nervous.hide()
	Surprise.hide()
	Afraid.hide()
	Insane.hide()

	match expression:
		"Normal":
			Normal.show()
		"Nervous":
			Nervous.show()
		"Surprise":
			Surprise.show()
		"Afraid":
			Afraid.show()
		"Insane":
			Insane.show()
