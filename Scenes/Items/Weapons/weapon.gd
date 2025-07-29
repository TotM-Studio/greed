extends Node
class_name Weapon

@export var disabled : bool = false
@onready var collision : CollisionShape2D = $AttackComponent/CollisionShape2D
@onready var attack : AttackComponent = $AttackComponent
@onready var sound : AudioStreamPlayer = $sound_effect

@export var dammages = 30
@export var knockback = 400

func _ready() -> void:
	attack.knockback = knockback
	attack.dammages = dammages

func _process(_delta: float) -> void:
	collision.disabled = disabled

func play_sound():
	sound.pitch_scale = randf()/2 + 0.9
	sound.play()
