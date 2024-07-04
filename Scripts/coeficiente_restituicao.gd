extends Panel

@export var e: float = 0

func _ready():
	$"Valor do E".text = "0"

func _on_value_changed(value):
	e = value
	$"Valor do E".text = str(e)
	if e == 0:
		$"Tipo Colisão".text = "COLISÃO INELÁSTICA"
	elif e == 1:
		$"Tipo Colisão".text = "COLISÃO ELÁSTICA"
	else:
		$"Tipo Colisão".text = "COLISÃO PARCIALMENTE ELÁSTICA"
