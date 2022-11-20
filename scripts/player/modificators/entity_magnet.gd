extends Area2D
class_name Magnet

export (String) var entity_group

var _entities = []
var _attract_force := 150.0
var _acceleration = Vector2()


func _on_Magnet_area_entered(area: Area2D) -> void:
	if is_instance_valid(area) and area.is_in_group(entity_group) and not area in _entities:
		_entities.append(area)


func _physics_process(delta: float) -> void:
	_acceleration = Vector2()
	for entity in _entities:
		if not is_instance_valid(entity):
			_entities.erase(entity)
			break
		
		var dir = (global_position - entity.global_position).normalized()
		_acceleration += dir * _attract_force
		
		entity.global_position += _acceleration * delta
