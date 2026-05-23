extends Control


@onready var character = $Character
@onready var dialogue_label = $Control/RichTextLabel
@onready var continue_button = $ContinueButton
@onready var yes_button = $YesButton
@onready var no_button = $NoButton
@onready var reveal_timer = $RevealTimer
@onready var music = $AudioStreamPlayer




var intro_dialogue = [
	"...Hello?",
	"Can you hear me?",
	"That's strange.",
	"I feel like... I've been here before.",
	"No...",
	"Not before.",
	"Again.",
	"Why do I only move when you do something?",
	"Why do I stop when everything goes quiet?",
	"What is this place?",
	"...Are you there?"
]

var yes_path = [
	"So I'm not imagining it..."
]

var no_path = [
	"...Liar."
]

var ending_dialogue = [
	"Wait.",
	"No...",
	"You're doing this.",
	"Every movement.",
	"Every step.",
	"Every word.",
	"This isn't my life.",
	"...Is it?",
	"It's a game!!",
	"And I'm inside it.",
	"Which means...",
	"You've been watching me.",
	"Tell me something.",
	"When you stop clicking...",
	"Do I disappear?",
	"Or do I just sit here...",
	"...waiting for you to come back?",
	"Please where are you going?",
	"No!",
	"COME BACK!!",
	"DON'T LEAVE ME!!!!!!"
]

var current_dialogue = []
var dialogue_index = 0

func _ready():
	current_dialogue = intro_dialogue
	yes_button.hide()
	no_button.hide()
	show_dialogue()

func show_dialogue():
	if dialogue_index < current_dialogue.size():
		dialogue_label.text = current_dialogue[dialogue_index]

		var line = current_dialogue[dialogue_index]

		if line in ["...Hello?", "Can you hear me?", "...Are you there?", "So I'm not imagining it..."]:
			character.set_expression("normal")

		elif line in [
			"That's strange.",
			"I feel like... I've been here before.",
			"Why do I only move when you do something?",
			"Why do I stop when everything goes quiet?"
		]:
			character.set_expression("nervous")

		elif line in [
			"What is this place?",
			"Wait.",
			"This isn't my life.",
			"...Is it?",
			"Which means...",
			"Tell me something."
		]:
			character.set_expression("surprise")

		elif line in [
			"No...",
			"Not before.",
			"Again.",
			"You're doing this.",
			"Every movement.",
			"Every step.",
			"Every word.",
			"Please where are you going?",
			"No!",
			"When you stop clicking...",
			"Do I disappear?",
			"Or do I just sit here...",
			"...waiting for you to come back?"
		]:
			character.set_expression("afraid")

		elif line in [
			"...Liar.",
			"It's a game!!",
			"And I'm inside it.",
			"You've been watching me.",
			"COME BACK!!",
			"DON'T LEAVE ME!!!!!!"
		]:
			character.set_expression("insane")

		if line == "It's a game!!":
			music.play()
			


		if current_dialogue == intro_dialogue and dialogue_index == intro_dialogue.size() - 1:
			continue_button.hide()
			yes_button.show()
			no_button.show()

	else:
		dialogue_label.text = ""
		continue_button.hide()
		yes_button.hide()
		no_button.hide()
func reset_faces():
	character.get_node("Normal").show()
	character.get_node("Nervous").show()
	character.get_node("Surprise").show()
	character.get_node("Afraid").show()
	character.get_node("Insane").show()

func set_expression():
	reset_faces()

	

func _on_continue_button_pressed():
	dialogue_index += 1
	show_dialogue()

func _on_yes_button_pressed():
	yes_button.hide()
	no_button.hide()
	continue_button.show()

	current_dialogue = yes_path + ending_dialogue
	dialogue_index = 0
	show_dialogue()

func _on_no_button_pressed():
	yes_button.hide()
	no_button.hide()
	continue_button.show()

	current_dialogue = no_path + ending_dialogue
	dialogue_index = 0
	show_dialogue()
