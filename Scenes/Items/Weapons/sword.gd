extends Node2D
class_name Weapon

@export var disabled : bool = false
@onready var collision = $AttackComponent/CollisionShape2D

@export var dammages = 30
@export var knockback = 400

func _ready() -> void:
	$AttackComponent.knockback = knockback
	$AttackComponent.dammages = dammages

func _process(_delta: float) -> void:
	collision.disabled = disabled

func play_sound():
	$"Swoosh-sound-effects".pitch_scale = randf()/2 + 0.9
	$"Swoosh-sound-effects".play()
