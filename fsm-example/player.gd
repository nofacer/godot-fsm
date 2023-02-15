extends CharacterBody2D

var state_machine: StateMachine


func _ready() -> void:
	self.state_machine = get_node("StateMachine")
	state_machine.cur_state.enter()


func _process(delta: float) -> void:
	state_machine.cur_state.update(delta)
