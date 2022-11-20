extends Node2D
class_name Spawner

export var safe_length := 1000

export (Resource) var difficulty setget set_difficulty
export (Array, Resource) var difficulties

var _current_difficulty_id := 0

onready var _player = Globals.player
onready var bounds = Globals.camera.bounds

onready var timer = $Timer
onready var enemies = difficulty.enemies
onready var max_enemies = difficulty.max_enemies

func _ready() -> void:
	randomize()
	Events.connect("difficulty_increased", self, "increase_difficulty")


func increase_difficulty():
	if _current_difficulty_id < difficulties.size():
		set_difficulty(difficulties[_current_difficulty_id])
		timer.wait_time = difficulty.time_to_spawn
		Logger.debug_log(difficulty.resource_path)
	_current_difficulty_id += 1

func set_difficulty(value):
	difficulty = value
	enemies = difficulty.enemies
	max_enemies = difficulty.max_enemies


func get_player_pos() -> Vector2:
	return _player.global_position


func get_bounds_size() -> Vector2:
	return bounds


func get_random_enemy():
	if enemies.size() == 0:
		Logger.debug_log("set up enemies in spawner node", MESSAGE_TYPE.ERROR)
		return
	return enemies[randi() % enemies.size()]


func _get_random_spawn_position() -> Vector2:
	var _bounds = get_bounds_size()
	var spawn_pos = Vector2 (
	rand_range(-_bounds.x, _bounds.x),
	rand_range(-_bounds.y, _bounds.y)
	)
	if spawn_pos.distance_to(get_player_pos()) < safe_length: 
		spawn_pos = _get_random_spawn_position() 
	return spawn_pos


func spawn_enemy(var enemy_prefab, var enemy_pos:Vector2=_get_random_spawn_position()):
	var enemy_i = enemy_prefab.instance()
	enemy_i.position = enemy_pos
	self.add_child(enemy_i)
	return enemy_i


func stop_spawner():
	timer.stop()


func _on_Timer_timeout():
	if get_child_count() > max_enemies:
		return
	spawn_enemy(get_random_enemy())
