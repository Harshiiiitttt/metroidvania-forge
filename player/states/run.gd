class_name PlayerStateRun extends PlayerState


#  What happens when the state is initialized?
func init() -> void:
	pass
	
	
# what happens when we enter this state?
func enter() -> void:
	player.animation_player.play("run")
	pass


# what happens when we exit this state?
func exit() -> void:
	pass
	

# What happens when an input is pressed?
func handle_input(_event : InputEvent) -> PlayerState:
	if _event.is_action_pressed("jump"):
		return jump
	return next_state
	
	
# What happens each process tick in this state?
func process(_delta: float) -> PlayerState:
	if player.directions.x == 0:
		return idle
	elif player.directions.y > 0.5:
		return crouch
	return next_state
	
	
# What happens each physiscs_process tick in this state?
func physics_process(_delta: float) -> PlayerState:
	player.velocity.x = player.directions.x * player.move_speed
	if player.is_on_floor() == false:
		return fall
	return next_state
