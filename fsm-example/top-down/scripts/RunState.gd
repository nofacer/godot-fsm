extends State

var speed := 150

func enter(_msg: Dictionary={}) -> void:
	var player: TopDownPlayer = self.target
	player.play_animation("run")

func update(_delta: float):
	var player: TopDownPlayer = self.target
	var direction := player.get_move_direction()
	player.flip_based_on_direction(direction)
	player.position += direction * self.speed * _delta
	
	if direction == Vector2(0, 0):
		self.state_machine.transition_to("IdleState")
		return
	
	if !Input.is_action_pressed("run"):
		self.state_machine.transition_to("WalkState")
		return
	
func exit():
	pass
