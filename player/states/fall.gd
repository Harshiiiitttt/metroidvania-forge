class_name PlayerStateFall extends PlayerState

@export var coyote_time : float = 0.4

var coyote_timer : float = 0

#  What happens when the state is initialized?
func init() -> void:
	pass
	
	
# what happens when we enter this state?
func enter() -> void:
	# play animation
	if player.previous_state == jump:
		coyote_timer = 0
	else:
		coyote_timer = coyote_time
	pass


# what happens when we exit this state?
func exit() -> void:
	pass
	

# What happens when an input is pressed?
func handle_input(_event : InputEvent) -> PlayerState:
	# handle input
	if _event.is_action_pressed("jump"):
		if coyote_timer > 0:
			return jump
		return jump
	return next_state
	
	
# What happens each process tick in this state?
func process(_delta: float) -> PlayerState:
	coyote_timer -= _delta
	return next_state
	
	
# What happens each physiscs_process tick in this state?
func physics_process(_delta: float) -> PlayerState:
	if player.is_on_floor():
		player.add_debug_indicator(Color.RED)
		return idle
	player.velocity.x = player.directions.x * player.move_speed
	return next_state
