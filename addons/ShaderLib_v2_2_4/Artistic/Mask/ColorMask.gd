@tool
class_name VisualShaderNodeMaskColorMask extends ShaderLib

func _get_name() -> String:
	return "ColorMask"

func _get_category() -> String:
	return "Artistic/Mask"

func _get_description() -> String:
	return "Creates a mask from values in input \"in\" equal to input \"mask color\"."

func _get_return_icon_type() -> PortType:
	return PORT_TYPE_VECTOR_4D

func _get_input_port_count() -> int:
	return 4

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "in"
		1:
			return "color mask"
		2:
			return "range"
		_:
			return "fuzziness"

func _get_input_port_type(port: int) -> PortType:
	match port:
		0, 1:
			return PORT_TYPE_VECTOR_3D
		_:
			return PORT_TYPE_SCALAR

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		0:
			return Vector3(1.0, 1.0, 1.0)
		1:
			return Vector3(0.0, 0.0, 0.0)
		_:
			return 0.0

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "out"

func _get_output_port_type(port: int) -> PortType:
	return PORT_TYPE_VECTOR_4D

func _get_global_code(mode: Shader.Mode) -> String:
	return "#include \"res://addons/ShaderLib_%s/Artistic/Artistic.gdshaderinc\"" % [version]

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var input: String = "vec3(0.0)"

	if input_vars[0]:
		input = input_vars[0]

	var color_mask: String = input_vars[1]
	var range: String = input_vars[2]
	var fuzziness: String = input_vars[3]

	return output_vars[0] + " = color_mask(%s, %s, %s, %s);" % [input, color_mask, range, fuzziness]
