@icon("res://addons/fsm/state.png")
class_name State
extends Node

var state_machine: StateMachine
var target


func enter(_msg: Dictionary = {}) -> void:
	pass


func update(_delta: float):
	pass


func exit():
	pass


func translate_to(state_name: String):
	self.state_machine.transition_to(state_name)


func translate_to_previous_state():
	if self.state_machine.previous_state != null:
		self.state_machine.transition_to(self.state_machine.previous_state.get_name())


func set_store(key: String, value):
	self.state_machine.store[key] = value


func get_store(key: String):
	return self.state_machine.store[key]
