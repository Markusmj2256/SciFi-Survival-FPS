extends Node3D

# GameManager is responsible for spawning waves of enemies and checking win/lose conditions.
class_name GameManager

@export var enemy_scene: PackedScene
@export var spawn_points: Array[Node3D] = []
@export var enemies_per_wave: int = 3
@export var time_between_waves: float = 4.0

var wave_number: int = 0
var enemies_alive: int = 0

func _ready() -> void:
    start_next_wave()

func start_next_wave() -> void:
    wave_number += 1
    enemies_alive = enemies_per_wave * wave_number
    spawn_wave(enemies_per_wave * wave_number)
    print("Starting wave " + str(wave_number) + ": spawning " + str(enemies_alive) + " enemies.")

func spawn_wave(count: int) -> void:
    for i in range(count):
        var spawn_point = spawn_points[i % spawn_points.size]
        var enemy = enemy_scene.instantiate()
        enemy.global_transform.origin = spawn_point.global_transform.origin
        # Connect a custom signal on the enemy to notify death
        enemy.connect("tree_exited", Callable(self, "_on_enemy_death"))
        add_child(enemy)

func _on_enemy_death(node: Node) -> void:
    # Called when an enemy leaves the scene tree (died)
    enemies_alive -= 1
    if enemies_alive <= 0:
        # All enemies for this wave defeated, schedule next wave
        var timer = get_tree().create_timer(time_between_waves)
        timer.connect("timeout", Callable(self, "start_next_wave"))
