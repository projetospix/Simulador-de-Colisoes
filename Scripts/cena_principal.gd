extends HBoxContainer

@onready var bolinha = %Bolinha
@onready var bolinha2 = %Bolinha2


# Called when the node enters the scene tree for the first time.
func _ready():
	bolinha.velocity.x = 100
	bolinha2.velocity.x = -300

func _physics_process(delta):
	var collision = bolinha.move_and_collide(bolinha.velocity * delta)
	bolinha2.move_and_collide(bolinha2.velocity * delta)
	if collision:
		var velocidade1 = bolinha.velocity
		bolinha.velocity = bolinha2.velocity
		bolinha2.velocity = velocidade1
