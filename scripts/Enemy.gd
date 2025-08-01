extends CharacterBody3D

# Basic enemy AI that moves towards the player and attacks via collision.
class_name Enemy

@export var speed: float = 2.5
@export var health: float = 30.0

var player: CharacterBody3D = null
var velocity: Vector3 = Vector3.ZERO

func _ready() -> void:
    # Attempt to find the player via group membership.
    var players = get_tree().get_nodes_in_group("player")
    if players.size() > 0:
        player = players[0]

func _physics_process(delta: float) -> void:
    if player and health > 0.0:
        var dir = (player.global_transform.origin - global_transform.origin).normalized()
        velocity = dir * speed
        velocity = move_and_slide(velocity, Vector3.UP)

func take_damage(amount: float) -> void:
    health -= amount
    if health <= 0.0:
        queue_free()
