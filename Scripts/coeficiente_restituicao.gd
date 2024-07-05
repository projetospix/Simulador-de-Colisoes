extends Panel

@export var e: float = 0
@onready var valor_do_e = %"Valor do E"
@onready var tipos_colisao = %TiposColisao

func _ready():
	valor_do_e.text = "0%"

func _on_value_changed(value):
	e = value
	valor_do_e.text = str(e*100)+"%"
	var tween = create_tween().set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_BACK)
	if e == 0:
		tween.tween_property(tipos_colisao, "position:y", -3, 0.2)
	elif e == 1:
		tween.tween_property(tipos_colisao, "position:y", -86, 0.2)
	else:
		tween.tween_property(tipos_colisao, "position:y", -44, 0.2)

