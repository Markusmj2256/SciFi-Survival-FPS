extends Weapon

# Concrete implementation of a plasma pistol.
class_name PlasmaPistol

func _ready() -> void:
    damage = 8.0
    fire_rate = 3.0  # slower rate, higher impact
    magazine_size = 15
    reload_time = 1.5
    current_ammo = magazine_size

func _fire_projectile() -> void:
    # Placeholder firing logic for plasma pistol.
    print("PlasmaPistol fired! Deal " + str(damage) + " damage.")
