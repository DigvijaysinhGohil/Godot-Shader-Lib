@tool
class_name VisualShaderNodeMathsManhattanDistance extends ShaderLib

func _get_name() -> String:
	return "ManhattanDistance"

func _get_category() -> String:
	return "Maths/Vector/Distance"

func _get_description() -> String:
	return "Returns the distance between two points using Manhattan distance matrix."

func _get_return_icon_type() -> PortType:
	return PORT_TYPE_SCALAR

func _get_input_port_count() -> int:
	return 2

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "a"
		_:
			return "b"

func _get_input_port_type(port: int) -> PortType:
	var vector_index: int = get_option_index(0)
	match vector_index:
		0:
			return PORT_TYPE_VECTOR_2D
		_:
			return PORT_TYPE_VECTOR_3D

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "distance"

func _get_output_port_type(port: int) -> PortType:
	return PORT_TYPE_SCALAR

func _get_property_count() -> int:
	return 1

func _get_property_name(index: int) -> String:
	return ""

func _get_property_default_index(index: int) -> int:
	return 0

func _get_property_options(index: int) -> PackedStringArray:
	return ["Vector2", "Vector3"]

func _get_global_code(mode: Shader.Mode) -> String:
	return "#include \"res://addons/ShaderLib_%s/Maths/Maths.gdshaderinc\"" % [version]

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var point_a: String
	var point_b: String
	var vector_index: int = get_option_index(0)
	match vector_index:
		0:
			point_a = "vec2(0)"
			point_b = "vec2(0)"
		_:
			point_b = "vec3(0)"
			point_a = "vec3(0)"

	if input_vars[0]:
		point_a = input_vars[0]

	if input_vars[1]:
		point_b = input_vars[1]

	match vector_index:
		0:
			return output_vars[0] + " = manhattan_distance_2d(%s, %s);" % [point_a, point_b]
		_:
			return output_vars[0] + " = manhattan_distance_3d(%s, %s);" % [point_a, point_b]
