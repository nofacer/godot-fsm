class_name TopDownPlayer

extends CharacterBody2D

@onready var animator: AnimatedSprite2D = get_node("Animator")
@onready var state_machine: StateMachine = get_node("StateMachine")

func _ready() -> void:
	state_machine.cur_state.enter()

func _process(delta: float) -> void:
	state_machine.cur_state.update(delta)
	if "direction" in state_machine.store:
		var direction: Vector2 = state_machine.store["direction"]
		if direction.x < 0 and !is_flip_h():
			flip_h()
		elif direction.x > 0 and is_flip_h():
			flip_h()

func play_animation(animation_name: String):
	animator.play(animation_name)

func is_flip_h() -> bool:
	return animator.flip_h

func flip_h():
	animator.flip_h = !animator.flip_h