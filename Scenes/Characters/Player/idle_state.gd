extends State

func Enter():
	parent.play("idle")

func Update():
	if Input.is_action_just_pressed("Attack"):
		quit_to("attack")

func Exit():
	parent.play("walk")
