extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

const SPEED = 100.0

enum State {IDLE, WALK}

@export var current_state : State = State.IDLE

@export var current_oct_angle : int = 0

@onready var visual_anchor: ExplorerVisual = $VisualAnchor



func _physics_process(delta: float) -> void:

    var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")

    if direction:
        velocity = SPEED * direction
    else:
        velocity = Vector2.ZERO

    move_and_slide()

    if velocity:
        visual_anchor.switch_direction(velocity)

    if velocity and current_state == State.IDLE:
        animation_player.play("walk")
        current_state = State.WALK
    elif not velocity and current_state == State.WALK:
        animation_player.play("idle")
        current_state = State.IDLE
