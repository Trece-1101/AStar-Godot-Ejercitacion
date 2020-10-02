extends TileMap

#### Set abierto, cerrado y de todos los nodos (validos)
var all_set = []
var open_set = []
var closed_set = []

var start_position : Vector2 = Vector2.ZERO # Posicion del player en el viewport
var end_position : Vector2 = Vector2.ZERO # Posicion del hongo en el viewport
var start_node: PathNode # Nodo correspondiente a la posicion del player
var end_node: PathNode # Nodo correspondiente a la posicion del hongo

#### Variables onready
onready var valid_tiles := get_used_cells() # posiciones/tiles validos

onready var open_tiles: TileMap = $NavOpen
onready var close_tiles: TileMap = $NavClose
onready var optimal_tiles: TileMap = $NavOptimal


#### Metodo que encuentra el camino entre el player y el hongo
func find_path(start, end) -> Array:
	start_position = pos_to_node(start) # convierto la posicion del player x,y en un vector c,f
	end_position = pos_to_node(end) # convierto la posicion del player x,y en un vector c,f
	
	init_grid(false)
	
	# TODO: este es el metodo principal
	return []


#### Metodo que inicializa la grilla. Para cada tile valido crea un objeto de
#### PathNode y lo instancia con su posicion y la H
func init_grid(show: bool) -> void:
	for position in valid_tiles:
		var node := PathNode.new(null, position, (manhattan_distance(position, end_position)) * 10)
		all_set.append(node) # agrega el nodo a la lista de nodos validos
		
		set_start_end_nodes(node) # setea el nodo start y end
	
	# Para debug
	if show:
		for node in all_set:
			print(node.print_node_data())


#### Metodo para setear nodos start y end
#### Pista: hay que usar el metodo de la clase PathNode "is_equal"
func set_start_end_nodes(node: PathNode) -> void:
	pass


#### Metodo que detecta los nodos aledaños del nodo en el que estamos parados (current)
#### Pista: el current_node que le estamos pasando deberia cerrarse y el problema de nodos
#### aledaños se resuelve pensando en matrices (con las filas y columnas y una mascara)
func find_closer_nodes(current_node: PathNode) -> PathNode:
	var dummy_node: PathNode
	return dummy_node



#### Metodo que chequea si el nodo aledaño es valido. Para ser valido debe cumplir:
#### - Encontrarse en la lista de nodos validos
#### - No encontrarse en la lista de nodos cerrados
#### - No ser el mismo nodo en que estamos parados
#### Si es valido se agrega a la lista de nodos abiertos y se le asigna el nodo padre
func open_nodes(node_position: Vector2, current_node: PathNode) -> void:
	## Aca abajo va codigo abriendo nodos
	pass


#### Metodo para calcular la distancia (manhattan) entre dos nodos
func manhattan_distance(point_1: Vector2, point_2: Vector2):
	return abs(point_1.x - point_2.x) + abs(point_1.y - point_2.y)


#### Como para la distancia de manhattan un nodo en diagonal esta a '2' de distancia
#### esto genera que distintos caminos tengan el mismo peso.
#### Por esto vamos a modificar un poco el valor devuelto para G
func get_diagonal(node_position: Vector2, parent_position: Vector2) -> int:
	var result: int = manhattan_distance(node_position, parent_position)
	
	## si el nodo evaluado esta en una fila y columna distinta al nodo padre
	## significa que esta en diagonal
	if node_position.x != parent_position.x and node_position.y != parent_position.y:
		result *= 7 # 2 * 7 = 14
	else:
		result *= 10 # 1 * 10 = 10
	
	return result


#### Metodo que itera en la lista de nodos abiertos y devuelve un nuevo nodo a cerrar/padre
func check_new_parent_node() -> PathNode:
	var dummy_parent_node: PathNode
	return dummy_parent_node


#### Metodo que convierte a una posicion [x,y] en coordenadas [col, fila]
func pos_to_node(position: Vector2) -> Vector2:
	return world_to_map(position)


#### Metodo que convierte una coordenada [col, fila] a posiciones [x, y]
#### Como los centros de los tiles estan defasados 32 pixeles hay que sumar ese vector
func node_to_pos(node_coord: Vector2) -> Vector2:
	return map_to_world(node_coord) + Vector2(32.0, 32.0)





