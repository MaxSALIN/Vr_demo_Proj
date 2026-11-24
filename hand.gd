extends XRController3D

class_name Hand 

var area: Area3D

var ray
var collision
var target
var parent_target


func _ready() -> void:
	area = $Area3D
	
	ray = $Area3D/RayCast3D/Ray
	ray.hide()
	collision = $Area3D/RayCast3D/Collision
	collision.hide()
	




func _on_button_pressed(action_name: String) -> void:
	if action_name == "trigger_touch":
		ray.show()
	if action_name == "trigger_click" and target:
		parent_target = target.get_parent_node_3d()



func _on_button_released(action_name: String) -> void:
	if action_name == "trigger_touch":
		ray.hide()
		collision.hide()
		if target!=null:
			target.reparent(parent_target)

	if action_name == "trigger_click" and target!=null:
		target.reparent(parent_target)


func _physics_process(delta: float) -> void:
	target = $Area3D/RayCast3D.get_collider()


		
