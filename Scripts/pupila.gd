extends Sprite2D

@onready var bolinha = self.get_owner()

var deslocamento_maximo:float = 0 ## deslocamento máximo da pupila para o lado
var outroPerto := false ## detectar se o outro corpo está perto
var direcaoDoOutro = 1 ## detectar para onde tem que olhar para ver o outro corpo

func _ready():
	position = Vector2.ZERO
	deslocamento_maximo = (get_parent().get_rect().size.x / 2) - (get_rect().size.x / 2)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var novaPosX:float = 0
	if outroPerto:
		novaPosX = deslocamento_maximo * direcaoDoOutro
	else:
		novaPosX = remap(bolinha.velocity.x, 0, 500, 0, deslocamento_maximo)
	position.x = lerp(position.x,novaPosX,delta*15)


func _on_area_proxima_body_entered(body):
	if body != bolinha:
		direcaoDoOutro = sign((body.global_position - global_position).normalized().x)
		outroPerto = true


func _on_area_proxima_body_exited(body):
	if body != bolinha:
		outroPerto = false
