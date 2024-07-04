extends CharacterBody2D

@export var modular := Color.CORAL
@onready var fundo = $Fundo

func _ready():
	fundo.modulate = modular
