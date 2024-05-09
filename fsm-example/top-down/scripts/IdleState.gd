extends State

func enter(_msg: Dictionary={}) -> void:
	var player: TopDownPlayer = self.target
	player.play_animation("idle")

func update(_delta: float):
	var player: TopDownPlayer = self.target
	var direction: Vector2 = player.get_move_direction()

	if direction.length() > 0:
		var next_state: String = "RunState" if Input.is_action_pressed("run") else "WalkState"
		self.state_machine.transition_to(next_state)

func exit():
	pass
