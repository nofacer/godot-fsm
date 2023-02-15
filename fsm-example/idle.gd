extends State


func enter(_msg: Dictionary = {}) -> void:
	print("enter idle state")


func update(_delta: float):
	if (
		Input.is_action_pressed("ui_up")
		or Input.is_action_pressed("ui_down")
		or Input.is_action_pressed("ui_left")
		or Input.is_action_pressed("ui_right")
	):
		self.state_machine.transition_to("Move")


func exit():
	print("exit idle state")
