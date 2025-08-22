extends State

func Enter():
	parent.play("idle")

func Update(_delta):
	if Input.is_action_just_pressed("Attack"):
		quit_to("attack")
	
	if Owner.direction != Vector2.ZERO:
		quit_to("walk")

func Exit():
	pass
