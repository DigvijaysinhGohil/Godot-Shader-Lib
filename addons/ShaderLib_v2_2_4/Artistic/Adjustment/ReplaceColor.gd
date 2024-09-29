@tool
class_name VisualShaderNodeAdjustmentReplaceColor extends ShaderLib

func _get_name() -> String:
	return "ReplaceColor"

func _get_category() -> String:
	return "Artistic/Adjustment"

func _get_description() -> String:
	return "Replaces values in input \"in\" equal to input \"from\" to the value of input \"to\"."

func _get_return_icon_type() -> PortType:
	return PORT_TYPE_VECTOR_3D

func _get_input_port_count() -> int:
	return 5

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "in"
		1:
			return "from"
		2:
			return "to"
		3:
			return "range"
		_:
			return "fuzziness"

func _get_input_port_type(port: int) -> PortType:
	match port:
		0, 1, 2:
			return PORT_TYPE_VECTOR_3D
		_:
			return PORT_TYPE_SCALAR

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		1, 2:
			return Vector3(0.0, 0.0, 0.0)
		3, 4:
			return 0.0
		_:
			return Vector3(1.0, 1.0, 1.0)

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "out"

func _get_output_port_type(port: int) -> PortType:
	return PORT_TYPE_VECTOR_3D

func _get_global_code(mode: Shader.Mode) -> String:
	return "#include \"res://addons/ShaderLib_%s/Artistic/Artistic.gdshaderinc\"" % [version]

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var input: String = "vec3(1.0)"
	var from: String = "vec3(1.0)"
	var to: String = "vec3(1.0)"

	if input_vars[0]:
		input = input_vars[0]

	if input_vars[1]:
		from = input_vars[1]

	if input_vars[2]:
		to = input_vars[2]

	var range: String = input_vars[3]
	var fuzziness: String = input_vars[4]

	return output_vars[0] + " = replace_color(%s, %s, %s, %s, %s);" % [input, from, to, range, fuzziness]
