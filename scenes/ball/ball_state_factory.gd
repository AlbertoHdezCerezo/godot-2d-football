class_name BallStateFactory

var states : Dictionary

func _init() -> void:
	states = {
		Ball.State.CARRIED: BallStateCarried,
		Ball.State.FREEFORM: BallStateFreeform,
		Ball.State.SHOT: BallStateShot
	}

func get_fresh_states(state: Ball.State) -> BallState:
	assert(states.has(state), "state doesn't exist!")
	return states.get(state).new()
