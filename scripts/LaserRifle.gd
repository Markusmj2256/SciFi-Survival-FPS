extends Weapon

# Concrete implementation of a sci‑fi laser rifle. Inherits from Weapon and sets specific stats.
class_name LaserRifle

func _ready() -> void:
    damage = 15.0
    fire_rate = 6.0  # fast firing laser
    magazine_size = 30
    reload_time = 2.0
    current_ammo = magazine_size

func _fire_projectile() -> void:
    # In a real game, you would perform a raycast or spawn a laser bolt here.
    # For now, we'll simply print a message to indicate a shot was fired.
    print("LaserRifle fired! Deal " + str(damage) + " damage.")
