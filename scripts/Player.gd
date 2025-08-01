extends CharacterBody3D

# Player movement and camera control for the SciFi-Survival-FPS.
# Handles walking, running, jumping and crouching.

const WALK_SPEED := 5.0
const RUN_SPEED := 8.0
const JUMP_VELOCITY := 5.0
const GRAVITY := Vector3.DOWN * 9.8

var mouse_sensitivity := 0.002
var velocity : Vector3 = Vector3.ZERO
var crouched : bool = false

@onready var camera: Camera3D = $Head/Camera3D

func _ready() -> void:
    # Capture the mouse for FPS control
    Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event: InputEvent) -> void:
    if event is InputEventMouseMotion:
        # Look around with mouse
        rotate_y(-event.relative.x * mouse_sensitivity)
        camera.rotate_x(-event.relative.y * mouse_sensitivity)
        # Clamp vertical rotation to avoid flipping
        camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, -90.0, 90.0)

func _physics_process(delta: float) -> void:
    var input_dir: Vector3 = Vector3.ZERO
    var forward: Vector3 = -transform.basis.z
    var right: Vector3 = transform.basis.x

    if Input.is_action_pressed("move_forward"):
        input_dir += forward
    if Input.is_action_pressed("move_backward"):
        input_dir -= forward
    if Input.is_action_pressed("move_left"):
        input_dir -= right
    if Input.is_action_pressed("move_right"):
        input_dir += right

    input_dir = input_dir.normalized()

    var speed := RUN_SPEED if Input.is_action_pressed("run") else WALK_SPEED
    var target_velocity := input_dir * speed

    velocity.x = target_velocity.x
    velocity.z = target_velocity.z

    # Apply gravity and jumping
    if not is_on_floor():
        velocity.y += GRAVITY.y * delta
    else:
        if Input.is_action_just_pressed("jump"):
            velocity.y = JUMP_VELOCITY
        else:
            velocity.y = 0.0

    # Handle crouching by lowering the camera
    if Input.is_action_pressed("crouch"):
        if not crouched:
            crouched = true
            camera.translation.y -= 0.5
    else:
        if crouched:
            crouched = false
            camera.translation.y += 0.5

    velocity = move_and_slide(velocity, Vector3.UP)
