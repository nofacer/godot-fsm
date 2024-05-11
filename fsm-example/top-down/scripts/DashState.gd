extends State

var dash_distance = 100
var speed = 400
var cur_distance = 0

func enter(_msg: Dictionary={}) -> void:
	self.cur_distance = 0
	var player: TopDownPlayer = self.target
	player.play_animation("dash")

func update(_delta: float):
	var player: TopDownPlayer = self.target
	var direction = self.state_machine.store["direction"]
	var distance: Vector2 = direction * self.speed * _delta
	player.position += distance
	cur_distance += distance.length()
	if cur_distance >= dash_distance:
		self.state_machine.transition_to(self.state_machine.store["pre_state"])

func exit():
	pass
