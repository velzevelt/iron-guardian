extends TextureProgress

onready var player = Globals.player
onready var max_health = player.max_health setget set_max_health, get_max_health

func set_max_health(value):
	max_health = value
func get_max_health():
	max_health = player.max_health
	return max_health


func _ready() -> void:
	player.connect("healed", self, "on_player_healed")
	player.connect("damage_taken", self, "on_damage_taken")
	max_value = self.max_health
	value = max_value


func on_player_healed(heal):
	max_value = self.max_health
	value += heal


func on_damage_taken(damage):
	value -= damage
