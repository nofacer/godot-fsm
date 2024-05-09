class_name TopDownPlayer

extends CharacterBody2D

@onready var animator: AnimatedSprite2D = get_node("Animator")
@onready var state_machine: StateMachine = get_node("StateMachine")

func _ready() -> void:
	state_machine.cur_state.enter()

func _process(delta: float) -> void:
	state_machine.cur_state.update(delta)
	
func play_animation(animation_name: String):
	animator.play(animation_name)

func get_move_direction() -> Vector2:
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	return input_direction

func flip_based_on_direction(direction: Vector2):
	if direction.x != 0:
		animator.flip_h = direction.x < 0