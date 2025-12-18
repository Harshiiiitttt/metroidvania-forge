class_name PlayerStateJump extends PlayerState

@export var jump_velocity : float = 450


#  What happens when the state is initialized?
func init() -> void:
	pass
	
	
# what happens when we enter this state?
func enter() -> void:
	player.animation_player.play("jump")
	player.add_debug_indicator(Color.LIME_GREEN)
	player.velocity.y = -jump_velocity
	pass


# what happens when we exit this state?
func exit() -> void:
	player.add_debug_indicator(Color.YELLOW)
	pass
	

# What happens when an input is pressed?
func handle_input(event : InputEvent) -> PlayerState:
	if event.is_action_released("jump"):
		player.velocity.y *= 0.5
		return fall
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
	
	return next_state
