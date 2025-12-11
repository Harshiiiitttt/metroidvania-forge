@icon( "res://player/states/state.svg" )
class_name PlayerState extends Node

var player : Player
var next_state : PlayerState= null

#region /// state references
@onready var idle: PlayerStateIdle = %Idle
@onready var run: PlayerStateRun = %Run
#endregion


#  What happens when the state is initialized?
func init() -> void:
	pass
	
	
# what happens when we enter this state?
func enter() -> void:
	pass


# what happens when we exit this state?
func exit() -> void:
	pass
	

# What happens when an input is pressed?
func handle_input(_event : InputEvent) -> PlayerState:      
	return next_state
	
	
# What happens each process tick in this state?
func process(_delta: float) -> PlayerState:
	return next_state
	
	
# What happens each physiscs_process tick in this state?
func physics_process(_delta: float) -> PlayerState:
	return next_state
