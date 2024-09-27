@tool
class_name VisualShaderNodeRayMarch extends ShaderLib

func _get_name() -> String:
	return "RayMarch"

func _get_category() -> String:
	return "RayMarching"

func _get_description() -> String:
	return "A simple ray marcher for primitive shapes."

func _get_return_icon_type() -> PortType:
	return PORT_TYPE_SCALAR

func _get_input_port_count() -> int:
	var sdf_index: int = get_option_index(0)
	match sdf_index:
		2, 3, 4:
			return 9
		_:
			return 8

func _get_input_port_name(port: int) -> String:
	var sdf_index: int = get_option_index(0)
	match sdf_index:
		0, 1:
			match port:
				0:
					return "ray origin"
				1:
					return "ray direction"
				2:
					return "max steps"
				3:
					return "max distance"
				4:
					return "distance threshold"
				5:
					return "cube pos" if sdf_index == 0 else "sphere pos"
				6:
					return "cube eulers" if sdf_index == 0 else "sphere eulers"
				_:
					return "cube scale" if sdf_index == 0 else "sphere scale"
		2, 3:
			match port:
				0:
					return "ray origin"
				1:
					return "ray direction"
				2:
					return "max steps"
				3:
					return "max distance"
				4:
					return "distance threshold"
				5:
					return "capsule pos" if sdf_index == 2 else "cylinder pos"
				6:
					return "capsule eulers" if sdf_index == 2 else "cylinder eulers"
				7:
					return "capsule height" if sdf_index == 2 else "cylinder height"
				_:
					return "capsule radius" if sdf_index == 2 else "cylinder radius"
		_:
			match port:
				0:
					return "ray origin"
				1:
					return "ray direction"
				2:
					return "max steps"
				3:
					return "max distance"
				4:
					return "distance threshold"
				5:
					return "torus pos"
				6:
					return "torus eulers"
				7:
					return "torus small radius"
				_:
					return "torus big radius"

func _get_input_port_type(port: int) -> PortType:
	var sdf_index: int = get_option_index(0)
	match sdf_index:
		0, 1:
			match port:
				0, 1, 5, 6, 7:
					return PORT_TYPE_VECTOR_3D
				2:
					return PORT_TYPE_SCALAR_INT
				_:
					return PORT_TYPE_SCALAR
		2, 3:
			match port:
				0, 1, 5, 6:
					return PORT_TYPE_VECTOR_3D
				2:
					return PORT_TYPE_SCALAR_INT
				_:
					return PORT_TYPE_SCALAR
		_:
			match port:
				0, 1, 5, 6:
					return PORT_TYPE_VECTOR_3D
				2:
					return PORT_TYPE_SCALAR_INT
				_:
					return PORT_TYPE_SCALAR

func _get_input_port_default_value(port: int) -> Variant:
	var sdf_index: int = get_option_index(0)
	match sdf_index:
		0, 1:
			match port:
				0, 5, 6:
					return Vector3(0, 0, 0)
				1:
					return Vector3(0 ,0 ,-1)
				2:
					return 15
				3:
					return 15.0
				7:
					return Vector3(0.3, 0.3, 0.3)
				_:
					return 1e-2
		2, 3:
			match port:
				0, 5, 6:
					return Vector3(0, 0, 0)
				1:
					return Vector3(0 ,0 ,-1)
				2:
					return 15
				3:
					return 15.0
				4:
					return 1e-2
				7:
					return .5 if sdf_index == 2 else 1.0
				_:
					return .3
		_:
			match port:
				0, 5, 6:
					return Vector3(0, 0, 0)
				1:
					return Vector3(0 ,0 ,-1)
				2:
					return 15
				3:
					return 15.0
				4:
					return 1e-2
				7:
					return 0.1
				_:
					return 0.4

func _get_property_count() -> int:
	return 1

func _get_property_default_index(index: int) -> int:
	return 0

func _get_property_name(index: int) -> String:
	return "SDF"

func _get_property_options(index: int) -> PackedStringArray:
	return ["SDBox", "SDSphere", "SDCapsule", "SDCylinder", "SDTorus"]

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "distance"

func _get_output_port_type(port: int) -> PortType:
	return PORT_TYPE_SCALAR

func _get_global_code(mode: Shader.Mode) -> String:
	return "#include \"res://addons/ShaderLib_%s/RayMarching/SignedDistanceFunctions.gdshaderinc\"" % [version]

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var sdf_index: int = get_option_index(0)
	var ray_origin: String = input_vars[0]
	var ray_direction: String = input_vars[1]
	var max_steps: String = input_vars[2]
	var max_dist: String = input_vars[3]
	var dist_threshold: String = input_vars[4]

	match sdf_index:
		0:
			var cube_pos: String = input_vars[5]
			var eulers: String = input_vars[6]
			var size: String = input_vars[7]
			return output_vars[0] + " = ray_march_sd_box(%s, %s, %s, %s, %s, %s, %s, %s);" % [ray_origin, ray_direction, max_steps, max_dist, dist_threshold, cube_pos, eulers, size]
		1:
			var sphere_pos: String = input_vars[5]
			var eulers: String = input_vars[6]
			var scale: String = input_vars[7]
			return output_vars[0] + " = ray_march_sd_sphere(%s, %s, %s, %s, %s, %s, %s, %s);" % [ray_origin, ray_direction, max_steps, max_dist, dist_threshold, sphere_pos, eulers, scale]
		2:
			var capsule_pos: String = input_vars[5]
			var capsule_eulers: String = input_vars[6]
			var capsule_height: String = input_vars[7]
			var capsule_radius: String = input_vars[8]
			return output_vars[0] + " = ray_march_sd_capsule(%s, %s, %s, %s, %s, %s, %s, %s, %s);" % [ray_origin, ray_direction, max_steps, max_dist, dist_threshold, capsule_pos, capsule_height, capsule_radius, capsule_eulers]
		3:
			var cylinder_pos: String = input_vars[5]
			var cylinder_eulers: String = input_vars[6]
			var cylinder_height: String = input_vars[7]
			var cylinder_radius: String = input_vars[8]
			return output_vars[0] + " = ray_march_sd_cylinder(%s, %s, %s, %s, %s, %s, %s, %s, %s);" % [ray_origin, ray_direction, max_steps, max_dist, dist_threshold, cylinder_pos, cylinder_height, cylinder_radius, cylinder_eulers]
		_:
			var torus_pos: String = input_vars[5]
			var eulers: String = input_vars[6]
			var small_radius: String = input_vars[7]
			var big_radius: String = input_vars[8]
			return output_vars[0] + " = ray_march_sd_torus(%s, %s, %s, %s, %s, %s, %s, %s, %s);" % [ray_origin, ray_direction, max_steps, max_dist, dist_threshold, torus_pos, eulers, small_radius, big_radius]
