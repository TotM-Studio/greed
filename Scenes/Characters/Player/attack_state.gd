extends State

@export_node_path("WeaponManager") var attack_animation_path
var attack_animation : WeaponManager

func _ready() -> void:
	attack_animation = get_node(attack_animation_path)

func Enter():
	if attack_animation != null:
		attack_animation.attack()

func Update():
	if !attack_animation.playing:
		quit_to("idle")
