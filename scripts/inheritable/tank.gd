extends KinematicBody2D
class_name Tank

#warning-ignore:unused_signal
signal damage_taken(damage)


### STATS ###
export (int) var speed := 200
export (int) var max_health := 5
export (float) var rotation_speed := 1.5
export (float) var bullet_speed := 1000.0
export (float) var fire_rate := 1.0 setget , get_fire_rate
export (float) var friction := 2.65
export (float) var turret_speed = 1.0

### PREFABS ###
export (PackedScene) var bullet 
export (PackedScene) var gunshot_fx


var velocity = Vector2()
var move_dir = Vector2()

var applied_rot = 0
var rotation_dir = 1

var can_fire := true
onready var health := max_health


onready var bullet_point = $Turret/BulletPoint
onready var turret = $Turret
onready var reload_timer = $ReloadTimer
onready var gunshot_sfx = $Gunshot


func fire() -> void:
	var gunshot_instance = gunshot_fx.instance()
	gunshot_instance.position = bullet_point.global_position
	Globals.world.add_child(gunshot_instance)
	var bullet_instance = bullet.instance()
	bullet_instance.lord = self
	bullet_instance.position = bullet_point.global_position
	bullet_instance.rotation = bullet_point.global_rotation
	bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed,0).rotated(turret.get_global_rotation()))
	gunshot_sfx.global_position = bullet_point.global_position
	Globals.world.add_child(bullet_instance)
	can_fire = false
	reload_timer.start()
	gunshot_sfx.play()


func set_fire_rate(value : float) -> void:
	fire_rate = value
	reload_timer.wait_time = fire_rate


func get_fire_rate() -> float:
	return fire_rate
