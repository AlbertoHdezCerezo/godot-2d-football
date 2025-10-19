class_name PlayerStateTackling

extends PlayerState

const DURATION_PRIOR_RECOVERY := 200
const GROUND_FRICTION := 250.0

var is_tackle_completed := false
var time_finish_tackle := Time.get_ticks_msec()

func _enter_tree() -> void:
	animation_player.play("tackle")

func _process(delta: float) -> void:
	if not is_tackle_completed:
		player.velocity = player.velocity.move_toward(Vector2.ZERO, delta * GROUND_FRICTION)
		if player.velocity == Vector2.ZERO:
			is_tackle_completed = true
			time_finish_tackle = Time.get_ticks_msec()
	if Time.get_ticks_msec() - time_finish_tackle > DURATION_PRIOR_RECOVERY:
		state_transition_requested.emit(Player.State.RECOVERING)

func _exit_tree() -> void:
	pass
