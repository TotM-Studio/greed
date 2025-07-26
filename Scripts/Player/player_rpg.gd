extends CharacterBody2D
class_name Player

var direction : Vector2 = Vector2.ZERO
@export var speed = 155
@export var acceleration = 3000
@export var health = 100
@export_category("Light")
@export var lightOn : bool = false

@onready var light : PointLight2D = $PointLight2D
@onready var animationTree : AnimationTree = $AnimationTree



func  _ready() -> void:
	animationTree.active = true

func _process(_delta: float) -> void:
	update_animation_tree()
	light.visible = lightOn

func _physics_process(delta: float) -> void:
	direction = Input.get_vector("Gauche","Droite","Haut","Bas").normalized()
	velocity.y = move_toward(velocity.y, direction.y * speed, acceleration * delta)
	velocity.x = move_toward(velocity.x, direction.x * speed, acceleration * delta)
	
	move_and_slide()

func update_animation_tree():
	if (velocity == Vector2.ZERO):
		animationTree["parameters/conditions/is_walking"] = false
		animationTree["parameters/conditions/idle"] = true
	else:
		animationTree["parameters/conditions/is_walking"] = true
		animationTree["parameters/conditions/idle"] = false
			
		animationTree["parameters/Idle/blend_position"] = direction
		animationTree["parameters/Walk/blend_position"] = direction
		
