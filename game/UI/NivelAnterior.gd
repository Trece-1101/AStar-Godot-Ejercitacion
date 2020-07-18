extends Button

export var nivel_anterior: String

func _on_NivelAnterior_pressed() -> void:
	get_tree().change_scene(nivel_anterior)
