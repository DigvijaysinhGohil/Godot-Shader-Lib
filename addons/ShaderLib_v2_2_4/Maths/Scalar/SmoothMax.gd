@tool
class_name VisualShaderNodeScalarSmoothMax extends ShaderLib

func _get_name() -> String:
	return "SmoothMax"

func _get_category() -> String:
	return "Maths/Scalar"

func _get_description() -> String:
	return "Returns the maximum value between A and B, but smooths out the intersections of A and B based on T."

func _get_return_icon_type() -> PortType:
	return PORT_TYPE_SCALAR

func _get_input_port_count() -> int:
	return 3

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "a"
		1:
			return "b"
		_:
			return "t"

func _get_input_port_type(port: int) -> PortType:
	return PORT_TYPE_SCALAR

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		2:
			return 0.5
		_:
			return 0.0

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "op"

func _get_output_port_type(port: int) -> PortType:
	return PORT_TYPE_SCALAR

func _get_global_code(mode: Shader.Mode) -> String:
	return "#include \"res://addons/ShaderLib_%s/Maths/Maths.gdshaderinc\"" % [version]

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var a: String = input_vars[0]
	var b: String = input_vars[1]
	var t: String = input_vars[2]

	return output_vars[0] + " = smoothmax(%s, %s, %s);" % [a, b, t]
