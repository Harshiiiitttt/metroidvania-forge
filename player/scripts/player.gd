class_name Player extends CharacterBody2D

const DEBUG_JUMP_INDICATOR = preload("uid://bjim3r6tafw28")


#region /// onready variables 
@onready var sprite: Sprite2D = $Sprite2D
@onready var collision_stand: CollisionShape2D = $CollisionStand
@onready var collision_crouch: CollisionShape2D = $CollisionCrouch
@onready var one_way_platform_shape_cast: ShapeCast2D = $OneWayPlatformShapeCast
@onready var animation_player: AnimationPlayer = $AnimationPlayer
#endregion


#region /// export variables
@export var move_speed : float = 150.0
@export var max_fall_speed : float = 600.0
#endregion


#region /// State Machine Variables
var states : Array[PlayerState]
var current_state : PlayerState :
	get : return states.front() #front returns the first element of the array
var previous_state : PlayerState :
	get : return states[1]
#endregion

#region /// standard variables
var directions : Vector2 = Vector2(0, 0) #or Vector2.ZERO
var gravity : float = 980
var gravity_multiplier : float = 1.0
#endregion



func _ready() -> void:
	initialize_states()
	self.call_deferred("reparent", get_tree().root)
	pass



func _unhandled_input(event: InputEvent) -> void:
	change_state(current_state.handle_input(event))
	pass



func _process(_delta: float) -> void:
	update_direction()
	change_state( current_state.process( _delta ) )
	pass



func _physics_process(_delta: float) -> void:
	velocity.y += gravity * _delta * gravity_multiplier
	velocity.y = clampf(velocity.y, -1000.0, max_fall_speed )
	move_and_slide()
	change_state( current_state.physics_process( _delta ) )
	pass



func initialize_states() -> void:
	states = []
	#gather all the states
	for c in $States.get_children():
		if c is PlayerState:
			states.append(c)
			c.player = self # self refers to the PLayer class
		pass
		
	if states.size() == 0:
		return
		 
	#initialize all states
	for state in states:
		state.init()
		
	change_state(current_state)
	current_state.enter()
	$Label.text = current_state.name
	pass
	
	 
	
func change_state(new_state : PlayerState) -> void:
	if new_state == null:
		return
	elif new_state == current_state:
		return
		
	if current_state:
		current_state.exit()
		
	states.push_front(new_state)
	current_state.enter()
	states.resize(3) #it will only keep 3 items and will remove the rest
	$Label.text = current_state.name
	pass



func update_direction() -> void:
	var prev_direction : Vector2 = directions

	var x_axis = Input.get_axis("left", "right")
	var y_axis = Input.get_axis("up", "down")
	directions = Vector2(x_axis, y_axis)
	
	if prev_direction.x != directions.x:
		if directions.x < 0:
			sprite.flip_h = true
		elif directions.x > 0:
			sprite.flip_h = false
	pass



func add_debug_indicator(color : Color = Color.RED) -> void:
	var d : Node2D = DEBUG_JUMP_INDICATOR.instantiate()
	get_tree().root.add_child(d)
	d.global_position = global_position
	d.modulate = color
	await get_tree().create_timer(3.0).timeout
	d.queue_free()
	pass
