class_name PlayerStateJump extends PlayerState

@export var jump_velocity : float = 450



#  What happens when the state is initialized?
func init() -> void:
	pass
	
	
# what happens when we enter this state?
func enter() -> void:
	# play animation
	player.velocity.y = -jump_velocity
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
	elif player.velocity.y >= 0:
		return fall
	player.velocity.x = player.directions.x * player.move_speed
	return next_state
