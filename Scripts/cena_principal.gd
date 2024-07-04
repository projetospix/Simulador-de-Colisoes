extends HBoxContainer

@onready var bolinha = %Bolinha
@onready var bolinha2 = %Bolinha2

@export var e: float = 0
@export var m1: float = 10
@export var m2: float = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	bolinha.velocity.x = 300
	bolinha2.velocity.x = -100

func _physics_process(delta):
	var collision = bolinha.move_and_collide(bolinha.velocity * delta)
	bolinha2.move_and_collide(bolinha2.velocity * delta)
	if collision:
		var velocidade1 = bolinha.velocity
		var velocidade2 = bolinha2.velocity
		CalculaVelocidades(m1, m2, velocidade1, velocidade2, e)

func CalculaVelocidades(m1, m2, v1_inicial, v2_inicial, e):
	var v1_final = ((m1 - e * m2)*v1_inicial + m2*(1+e)*v2_inicial)/(m1+m2)  
	var v2_final = ((m2 - e * m1)*v2_inicial + m2*(1+e)*v1_inicial)/(m1+m2)
	print(v1_final, v2_final)	
	bolinha.velocity = v1_final
	bolinha2.velocity = v2_final
