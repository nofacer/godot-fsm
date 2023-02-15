extends State


func enter(_msg: Dictionary = {}) -> void:
	print("enter move state")


func update(_delta: float):
	var direction = Vector2i(0, 0)
	if Input.is_action_pressed("ui_up"):
		direction += Vector2i(0, -1)
	if Input.is_action_pressed("ui_down"):
		direction += Vector2i(0, 1)
	if Input.is_action_pressed("ui_left"):
		direction += Vector2i(-1, 0)
	if Input.is_action_pressed("ui_right"):
		direction += Vector2i(1, 0)
	var player = self.target as CharacterBody2D
	if direction == Vector2i(0, 0):
		self.state_machine.transition_to("Idle")
	else:
		player.position += direction * 1000 * _delta


func exit():
	print("exit move state")
