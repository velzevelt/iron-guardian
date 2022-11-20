extends StaticBody2D

export var max_health := 30

var health := max_health

signal damage_taken(damage)
signal healed(heal)


func take_damage(var damage := 1) -> void:
	health -= damage
	emit_signal("damage_taken",damage)
	if health <= 0:
		Globals.call("loose")

func heal(heal_value : int):
	health += heal_value
	emit_signal("healed", heal_value)


func _ready() -> void:
	Globals.hq = self
