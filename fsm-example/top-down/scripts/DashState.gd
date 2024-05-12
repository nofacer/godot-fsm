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
	var dash_direction = self.get_store("dash_direction")
	var distance: Vector2 = dash_direction * self.speed * _delta
	player.position += distance
	cur_distance += distance.length()
	if cur_distance >= dash_distance:
		self.translate_to_previous_state()

func exit():
	pass
