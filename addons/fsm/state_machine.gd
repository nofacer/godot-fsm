@icon("res://addons/fsm/state_machine.png")
class_name StateMachine
extends Node

@export var init_state = NodePath()
@onready var _target_node: Node = get_parent() as Node

var cur_state: State
var previous_state: State

var _map: Dictionary = {}
var store: Dictionary = {}

func _ready():
	if init_state.is_empty():
		return
	for child in get_children():
		if child is State:
			child.state_machine = self
			child.target = _target_node
			_map[child.name] = child
	cur_state = get_node(init_state) as State

func transition_to(state_name: String):
	previous_state = cur_state
	cur_state.exit()
	cur_state = _map[state_name]
	cur_state.enter()
