extends Sprite

const MOV_SPEED: Vector2 = Vector2(128, 128)

signal START

func _process(delta: float) -> void:
	var velocity: Vector2 = Vector2.ZERO
	
	position += velocity * MOV_SPEED * delta

# Metodo que envia señal de comenzar
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("start"):
		emit_signal("START")
