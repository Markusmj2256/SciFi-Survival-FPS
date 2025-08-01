extends Node3D

# Base weapon class providing common functionality for all weapons.
# Weapons handle ammo tracking, fire rate limiting and reloading.

class_name Weapon

@export var damage: float = 10.0
@export var fire_rate: float = 2.0 # shots per second
@export var magazine_size: int = 20
@export var reload_time: float = 2.0 # seconds to reload

var current_ammo: int = magazine_size
var can_fire: bool = true
var _last_fire_time: float = 0.0

func _ready() -> void:
    current_ammo = magazine_size

func _process(delta: float) -> void:
    # Handle cooldown between shots
    if not can_fire:
        var time_since_fire = (Time.get_ticks_msec() / 1000.0) - _last_fire_time
        if time_since_fire >= 1.0 / fire_rate:
            can_fire = true

func shoot() -> bool:
    """
    Attempts to fire the weapon. Returns true if a shot was fired.
    Derived classes should override _fire_projectile() to implement the firing behaviour.
    """
    if not can_fire or current_ammo <= 0:
        return false
    _fire_projectile()
    current_ammo -= 1
    can_fire = false
    _last_fire_time = Time.get_ticks_msec() / 1000.0
    return true

func _fire_projectile() -> void:
    # This method should be overridden in subclasses to perform the actual firing logic
    pass

async func reload() -> void:
    """
    Reload the weapon. This waits for reload_time seconds before restoring ammo.
    """
    if current_ammo == magazine_size:
        return
    can_fire = false
    await get_tree().create_timer(reload_time).timeout
    current_ammo = magazine_size
    can_fire = true
