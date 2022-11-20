extends Single

var score := 0 setget set_score, get_score

func set_score(value):
	score = value
	Events.emit_signal("score_changed", score)

func get_score():
	return score

var stars := 0

var killed_enemies := 0


func reset_data():
	score = 0
	stars = 0
	killed_enemies = 0
