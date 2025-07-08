extends State

var speed := 80


func enter(_msg: Dictionary = {}) -> void:
	var player: TopDownPlayer = self.target
	player.play_animation("walk")


func update(_delta: float):
	var player: TopDownPlayer = self.target
	var direction := player.get_move_direction()
	player.flip_based_on_direction(direction)
	player.position += direction * self.speed * _delta

	if direction == Vector2(0, 0):
		self.translate_to("IdleState")
		return

	if Input.is_action_just_pressed("dash"):
		self.set_store("dash_direction", direction)
		self.translate_to("DashState")
		return

	if Input.is_action_pressed("run"):
		self.translate_to("RunState")
		return


func exit():
	pass
