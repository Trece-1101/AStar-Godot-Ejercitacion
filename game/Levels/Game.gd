extends Node2D

onready var nav_map: TileMap = $NavMap
onready var player: Sprite = $Player
onready var hongo: Sprite = $Hongo

var already_start: bool = false

func _ready() -> void:
	hongo.connect("START", self, "_calculate_new_path")

func _calculate_new_path() -> void:
	if not already_start:
		already_start = true
		var path = nav_map.find_path(player.position, hongo.position)
		
		if path:
			path.remove(0)
			
			player.path = path
