class_name PlayerStateFall extends PlayerState


#  What happens when the state is initialized?
func init() -> void:
	pass
	
	
# what happens when we enter this state?
func enter() -> void:
	# play animation
	pass


# what happens when we exit this state?
func exit() -> void:
	pass
	

# What happens when an input is pressed?
func handle_input(_event : InputEvent) -> PlayerState:
	# handle input
	return next_state
	
	
# What happens each process tick in this state?
func process(_delta: float) -> PlayerState:
	return next_state
	
	
# What happens each physiscs_process tick in this state?
func physics_process(_delta: float) -> PlayerState:
	if player.is_on_floor():
		return idle
	player.velocity.x = player.directions.x * player.move_speed
	return next_state
