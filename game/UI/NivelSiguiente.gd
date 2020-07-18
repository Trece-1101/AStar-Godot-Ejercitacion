extends Button

export var nivel_siguiente: String

func _on_NivelSiguiente_pressed() -> void:
	get_tree().change_scene(nivel_siguiente)
