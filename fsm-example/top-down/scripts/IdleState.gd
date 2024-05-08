extends State

func enter(_msg: Dictionary={}) -> void:
	var player: TopDownPlayer = self.target
	player.play_animation("idle")

func update(_delta: float):
	if (
		Input.is_action_pressed("ui_up")
		or Input.is_action_pressed("ui_down")
		or Input.is_action_pressed("ui_left")
		or Input.is_action_pressed("ui_right")
	):
		if (Input.is_action_pressed("run")):
			self.state_machine.transition_to("RunState")
		else:
			self.state_machine.transition_to("WalkState")

func exit():
	pass
