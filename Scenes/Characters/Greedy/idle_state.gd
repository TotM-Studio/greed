extends State

func Update(delta):
	if Owner.timer.is_stopped() or Owner.is_on_ceiling() or Owner.is_on_floor() or Owner.is_on_wall():
		Owner.randomize_direction()
	Owner.position += Owner.direction * Owner.speed * delta
