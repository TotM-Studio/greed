extends Character
class_name Player

var direction : Vector2 = Vector2.ZERO
@export var speed = 155
@export var runningSpeed = 240
@export var acceleration = 3000
@export_category("Light")
@export var lightOn : bool = false
@export_category("Camera")
@export var limit_right : int = 1080
@export var limit_bottom : int = 720

@onready var light : PointLight2D = $PointLight2D
@onready var camera : Camera2D = $Camera2D
@onready var weapons : WeaponManager = $Components/Weapons

var move : bool = true

func  _ready() -> void:
	Gui.show_gui()
	camera.limit_bottom = limit_bottom
	camera.limit_right = limit_right
	light.visible = lightOn

func _physics_process(delta: float) -> void:
	move = !weapons.playing
	if move:
		direction = Input.get_vector("Gauche","Droite","Haut","Bas").normalized()
		velocity.y = move_toward(velocity.y, direction.y * speed, acceleration * delta)
		velocity.x = move_toward(velocity.x, direction.x * speed, acceleration * delta)
		
		if direction != Vector2.ZERO:
			weapons.global_rotation = direction.angle() + 0.5 * PI
		
		move_and_slide()
