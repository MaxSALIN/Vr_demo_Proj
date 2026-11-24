extends Hand

		

func _physics_process(delta: float) -> void:
	super(delta)

	if ray.is_visible() and target:
		collision.global_position=$Area3D/RayCast3D.get_collision_point()
		collision.show()
		if is_button_pressed("trigger_click") and target.is_in_group("button"):
			target.clicked.emit()
		if target.is_in_group("pickable") and is_button_pressed("trigger"):
				target.reparent(self)
				if is_button_pressed("primary"):

					var depth = get_vector2("primary").y * 0.1
					target.global_position += -$Area3D/RayCast3D.global_basis.y * depth
			
		
	else :
		collision.hide()

		
