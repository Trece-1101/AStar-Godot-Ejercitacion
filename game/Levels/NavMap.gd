extends TileMap

#### Set abierto, cerrado y de todos los nodos (validos)
var all_set = []
var open_set = []
var closed_set = []

#### Variables onready
onready var valid_tiles := get_used_cells() # posiciones/tiles validos

onready var open_tiles: TileMap = $NavOpen
onready var close_tiles: TileMap = $NavClose
onready var optimal_tiles: TileMap = $NavOptimal


#### Metodo que encuentra el camino entre el player y el hongo
func find_path(start, end):
	# TODO: este es el metodo principal
	pass


#### Metodo que inicializa la grilla. Para cada tile valido crea un objeto de
#### PathNode y lo instancia con su posicion y la H
func init_grid(show: bool) -> void:
	pass


#### Metodo que detecta los nodos aledaños del nodo en el que estamos parados (current)
func find_closer_nodes(current_node: PathNode) -> PathNode:
	var dummy_node: PathNode
	return dummy_node

#### Metodo para calcular la distancia (manhattan) entre dos nodos
func manhattan_distance(point_1: Vector2, point_2: Vector2):
	return abs(point_1.x - point_2.x) + abs(point_1.y - point_2.y)
