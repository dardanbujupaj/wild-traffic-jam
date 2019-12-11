extends VehicleBody

# is set in the 3d editor
export var is_player = false


# Called when the node enters the scene tree for the first time.
func _ready():
	if is_player:
		$Camera.current = true
	pass # Replace with function body.


func _physics_process(delta):
	# process movement if player controls this car
	if is_player:
		
		engine_force = 0
		brake = 0
		
		if Input.is_action_pressed("forward"):
			engine_force = 50
			
		if Input.is_action_pressed("backward"):
			if linear_velocity.dot(transform.basis.z) > 0:
				brake = 5
				pass
			else:
				engine_force = -20
		
		if Input.is_action_pressed("left"):
			steering = PI / 4
		elif Input.is_action_pressed("right"):
			steering = -PI / 4
		else:
			steering = 0
	else:
		if $RayCast.get_collider() == null:
			engine_force = 10
			brake = 0
		else:	
			engine_force = 0
			brake = 10

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
