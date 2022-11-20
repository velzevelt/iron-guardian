extends Node

var camera
var player
var modificators
var hq
var world

var game_over_panel := preload("res://prefabs/ui/game_over.tscn")
var level_up_panel := preload("res://prefabs/ui/level_up_menu.tscn")


var game = preload("res://scenes/game.tscn")
var menu = preload("res://scenes/menu.tscn")


func loose() -> void:
	var game_over = game_over_panel.instance()
	world.add_child(game_over)
	get_tree().paused = true

func level_update() -> void:
	var level_up = level_up_panel.instance()
	get_tree().get_root().add_child(level_up)
	get_tree().paused = true


func change_scene(var scene : PackedScene) -> void:
	Events.emit_signal("scene_changed")
	get_tree().change_scene_to(scene)


func reload_scene() -> void:
	Events.emit_signal("scene_changed")
	get_tree().reload_current_scene()


func purchase(price) -> void:
	if price <= Globals.player.star_count:
		Globals.player.star_count -= price
		ItemActions.init_current_action()
		Events.emit_signal("item_bought", ItemActions.current_item)
	else:
		Events.emit_signal("purchase_failed")
