extends Panel

@export var m: float = 0
@export var v0: float = 0

func _ready():
	_on_slider_massa_value_changed(1)
	_on_slider_v_0_value_changed(50)


func _on_slider_massa_value_changed(value):
	m = value
	$"Valor Massa".text = str(m) + " kg"


func _on_slider_v_0_value_changed(value):
	v0 = value
	$"Valor V0".text = str(v0) +  " m/s"
