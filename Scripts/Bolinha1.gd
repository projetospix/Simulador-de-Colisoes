extends Panel

@export var m: float = 0
@export var v0: float = 0
@onready var valor_massa = $"SliderMassa/Valor Massa"
@onready var valor_v0 = $"SliderV0/Valor V0"

func _ready():
	_on_slider_massa_value_changed(1)
	_on_slider_v_0_value_changed(50)


func _on_slider_massa_value_changed(value):
	m = value
	valor_massa.text = str(m) + " kg"


func _on_slider_v_0_value_changed(value):
	v0 = value
	valor_v0.text = str(v0) +  " m/s"
