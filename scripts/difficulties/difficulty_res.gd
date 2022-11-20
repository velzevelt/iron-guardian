extends Resource
class_name Difficulty


export var max_enemies := 3
export (Array, PackedScene) var enemies 

export (float) var time_to_spawn := 4.0
export (bool) var one_shot := false
