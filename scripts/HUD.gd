extends CanvasLayer

@onready var health_label: Label = $HealthLabel
@onready var ammo_label: Label = $AmmoLabel
@onready var score_label: Label = $ScoreLabel

func update_health(value: int):
    health_label.text = "Health: %d" % value

func update_ammo(current: int, max: int):
    ammo_label.text = "Ammo: %d / %d" % [current, max]

func update_score(value: int):
    score_label.text = "Score: %d" % value
