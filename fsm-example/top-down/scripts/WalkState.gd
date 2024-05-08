extends State

func enter(_msg: Dictionary={}) -> void:
	var player: TopDownPlayer = self.target
	player.play_animation("walk")

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
	
	self.state_machine.store["direction"] = direction
	
	var player = self.target as TopDownPlayer
	
	if direction == Vector2i(0, 0):
		self.state_machine.transition_to("IdleState")
	elif Input.is_action_pressed("run"):
		print(66)
		self.state_machine.transition_to("RunState")
	else:
		player.position += direction * 100 * _delta

func exit():
	pass
