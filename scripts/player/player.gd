extends Tank
class_name Player

signal healed(heal)

onready var _bounds = Globals.camera.bounds

var star_count := 0



func _get_input():
	rotation_dir = 0
	move_dir = Vector2()
	if Input.is_action_pressed("move_down"):
		move_dir = Vector2(-speed / 2.0, 0).rotated(rotation)
	elif Input.is_action_pressed("move_up"):
		move_dir = Vector2(speed, 0).rotated(rotation)
	if Input.is_action_pressed("move_right"):
		rotation_dir += Input.get_action_strength("move_right") + rotation_speed
	elif Input.is_action_pressed("move_left"):
		rotation_dir -= Input.get_action_strength("move_left") + rotation_speed
	if Input.is_action_pressed("breake"):
		move_dir = move_dir.linear_interpolate(Vector2.ZERO, 1)  
	

func _fire() -> void:
	if Input.is_action_just_pressed("mouse_left") and can_fire:
		Globals.camera.shake(100)
		fire()


func _physics_process(delta):
	velocity += move_dir * delta
	move_and_slide(velocity,Vector2.ZERO)
	velocity = velocity.linear_interpolate(Vector2.ZERO, friction*delta)
	
	applied_rot = lerp_angle(applied_rot, rotation_dir * delta, 0.1)
	
	rotate(applied_rot)
	
	_get_input()
	_fire()
	_wrap_player()


func _wrap_player() -> void:
	if abs(position.x) > _bounds.x:
		if position.x > 0:
			position.x = _bounds.x
		else:
			position.x = -_bounds.x
	if abs(position.y) > _bounds.y:
		if position.y > 0:
			position.y = _bounds.y
		else:
			position.y = -_bounds.y

func _ready():
	Globals.player = self
	Events.connect("level_upped", self, "_on_player_level_upped")


func take_damage(var damage := 1) -> void:
	health -= damage
	emit_signal("damage_taken",damage)
	if health <= 0:
		Globals.call("loose")


func heal(var heal : int) -> void:
	if health + heal > max_health:
		heal = max_health - health
	
	health += heal
	emit_signal("healed", heal)


func _on_player_level_upped(_level):
	heal(max_health - health)
	Globals.call("level_update")


func _on_Timer_timeout():
	can_fire = true


func set_turret_speed(value):
	var turret = $Turret
	if turret:
		turret.turn_speed += deg2rad(value)
	else:
		Logger.debug_log("turret not found" + " " + get_name(), MESSAGE_TYPE.ERROR)
