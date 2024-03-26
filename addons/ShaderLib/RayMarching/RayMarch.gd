@tool
class_name VisualShaderNodeRayMarch extends VisualShaderNodeCustom

func _get_name() -> String:
	return "RayMarch"

func _get_category() -> String:
	return "RayMarching"

func _get_description() -> String:
	return "A simple ray marcher."

func _get_return_icon_type() -> PortType:
	return PORT_TYPE_SCALAR

func _get_input_port_count() -> int:
	return 6

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "signed distance"
		1:
			return "ray origin"
		2:
			return "ray direction"
		3:
			return "max steps"
		4:
			return "max distance"
		_:
			return "distance threshold"

func _get_input_port_type(port: int) -> PortType:
	match port:
		1, 2:
			return PORT_TYPE_VECTOR_3D
		3:
			return PORT_TYPE_SCALAR_INT
		_:
			return PORT_TYPE_SCALAR

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		1:
			return Vector3(0, 0, -1)
		2:
			return Vector3(0 ,0 ,0)
		3:
			return 15
		4:
			return 15.0
		5:
			return 1e-2
		_:
			return null

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "distance"

func _get_output_port_type(port: int) -> PortType:
	return PORT_TYPE_SCALAR

func _get_global_code(mode: Shader.Mode) -> String:
	var code: String = preload("RayMarch.gdshaderinc").code
	return code

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var signed_distance: String = "0.0"

	if input_vars[0]:
		signed_distance = input_vars[0]

	var ray_origin: String = input_vars[1]
	var ray_direction: String = input_vars[2]
	var max_steps: String = input_vars[3]
	var max_dist: String = input_vars[4]
	var dist_threshold: String = input_vars[5]

	return output_vars[0] + " = ray_march(%s, %s, %s, %s, %s, %s);" % [ray_origin, ray_direction, max_steps, max_dist, dist_threshold, signed_distance]
