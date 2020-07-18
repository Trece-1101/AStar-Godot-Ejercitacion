extends Sprite

const MOV_SPEED := 200
const POINT_RADIUS := 2

var path

func _process(delta: float) -> void:
	if path:
		var target = path[0]
		
		var direction: Vector2 = (target - position).normalized()
		
		position += direction * MOV_SPEED * delta
		
		if position.distance_to(target) < POINT_RADIUS:
			path.remove(0)
			
			if path.size() == 0:
				path = null
