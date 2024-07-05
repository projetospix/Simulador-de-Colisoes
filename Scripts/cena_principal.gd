extends HBoxContainer

@onready var bolinha := %Bolinha
@onready var bolinha2 := %Bolinha2
@onready var coeficiente := %Coeficiente

@onready var painel_bolinha1 := $"Painel de Controle/Bolinha1"
@onready var painel_bolinha2 := $"Painel de Controle/Bolinha2"

@onready var bolinha_pos_inicial:Vector2 = bolinha.position
@onready var bolinha2_pos_inicial:Vector2 = bolinha2.position

var colidiu := false

# Called when the node enters the scene tree for the first time.
func _ready():
	_on_reiniciar()

func _physics_process(delta):
	var collision = bolinha.move_and_collide(bolinha.velocity * delta)
	bolinha2.move_and_collide(bolinha2.velocity * delta)
	if collision and not colidiu:
		colidiu = true
		var velocidade1 = bolinha.velocity
		var velocidade2 = bolinha2.velocity
		CalculaVelocidades(painel_bolinha1.m, painel_bolinha1.m, velocidade1, velocidade2, coeficiente.e)

func CalculaVelocidades(m1, m2, v1_inicial, v2_inicial, e):
	var v1_final = ((m1 - e * m2)*v1_inicial + m2*(1+e)*v2_inicial)/(m1+m2)  
	var v2_final = ((m2 - e * m1)*v2_inicial + m2*(1+e)*v1_inicial)/(m1+m2)
	print(v1_final, v2_final)	
	bolinha.velocity = v1_final
	bolinha2.velocity = v2_final

func _on_iniciar():
	bolinha.velocity.x = painel_bolinha1.v0*5
	bolinha2.velocity.x = - painel_bolinha2.v0*5
	get_tree().set_group("Sliders", "editable", false)
	get_tree().set_group("cadeado", "visible", true)
	%Reiniciar.visible = true
	%Iniciar.visible = false


func _on_reiniciar():
	colidiu = false
	bolinha.velocity.x = 0
	bolinha2.velocity.x = 0
	bolinha.position = bolinha_pos_inicial
	bolinha2.position = bolinha2_pos_inicial
	get_tree().set_group("Sliders", "editable", true)
	get_tree().set_group("cadeado", "visible", false)
	%Iniciar.visible = true
	%Reiniciar.visible = false
