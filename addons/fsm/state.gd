@icon("res://addons/fsm/state.svg")
extends Node
class_name State

var state_machine: StateMachine
var target


func enter(_msg: Dictionary = {}) -> void:
	pass


func update(_delta: float):
	pass


func exit():
	pass
