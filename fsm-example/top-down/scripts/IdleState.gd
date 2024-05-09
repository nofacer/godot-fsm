extends State

func enter(_msg: Dictionary={}) -> void:
	var player: TopDownPlayer = self.target
	player.play_animation("idle")

func update(_delta: float):
	var direction = Vector2i(0, 0)
	if Input.is_action_pressed("ui_up"):
		direction += Vector2i(0, -1)
	if Input.is_action_pressed("ui_down"):
		direction += Vector2i(0, 1)
	if Input.is_action_pressed("ui_left"):
		direction += Vector2i( - 1, 0)
	if Input.is_action_pressed("ui_right"):
		direction += Vector2i(1, 0)

	if direction != Vector2i(0, 0):
		if (Input.is_action_pressed("run")):
			self.state_machine.transition_to("RunState")
		else:
			self.state_machine.transition_to("WalkState")

func exit():
	pass
