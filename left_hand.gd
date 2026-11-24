extends Hand

@export var translation_speed : float
@export var rotation_speed : float
@export var camera : XRCamera3D

var timer_rotation : Timer
var timer_teleport : Timer

func _ready() -> void:
	super()
	timer_rotation = ready_timer(0.1)
	timer_teleport = ready_timer(0.5)

func ready_timer(time) -> Timer:
	var timer = Timer.new()
	timer.wait_time = time
	timer.one_shot = true
	add_child(timer)
	return timer

func _physics_process(delta: float) -> void:
	super(delta)
	var origin = get_parent_node_3d()

	#Mouvement and rotation
	if is_button_pressed("primary"):
		var pos = get_vector2("primary")

		
		var camera_mvt = camera.global_basis.z
		camera_mvt.y=0
		origin.global_position -=  pos.y * translation_speed * camera_mvt *delta
		camera.show()
		
		if timer_rotation.is_stopped():
			origin.global_rotation -= Vector3(0,pos.x * rotation_speed * delta, 0)
			timer_rotation.start()
	else:
		camera.hide()
			
	#ray
	if ray.is_visible() and target:
		collision.global_position=$Area3D/RayCast3D.get_collision_point()
		collision.show()
		if is_button_pressed("trigger_click") and timer_teleport.is_stopped():
			origin.global_position=collision.global_position
			timer_teleport.start()
	else:
		collision.hide()
