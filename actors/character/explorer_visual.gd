class_name ExplorerVisual
extends Node2D

@onready var idle_sprite: Sprite2D = $IdleSprite
@onready var walk_sprite: Sprite2D = $WalkSprite


func angle_to_8_dir(direction : Vector2) -> int:
    var angle : float = atan2( direction.y, direction.x )
    var oct_direction : int = int(round(8 * (angle - PI/2) / (2*PI) + 8)) % 8    
    return oct_direction

func switch_direction(direction : Vector2):
    var oct_direction : int = angle_to_8_dir(direction)

    idle_sprite.frame_coords.y = oct_direction
    walk_sprite.frame_coords.y = oct_direction
