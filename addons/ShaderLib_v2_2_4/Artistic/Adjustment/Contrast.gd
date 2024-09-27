@tool
class_name VisualShaderNodeAdjustmentContrast extends ShaderLib

func _get_name() -> String:
	return "Contrast"

func _get_category() -> String:
	return "Artistic/Adjustment"

func _get_description() -> String:
	return "Adjusts the contrast of input in by the amount of input contrast."

func _get_return_icon_type() -> PortType:
	return PORT_TYPE_VECTOR_3D

func _get_input_port_count() -> int:
	return 2

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "in"
		_:
			return "contrast"

func _get_input_port_type(port: int) -> PortType:
	match port:
		0:
			return PORT_TYPE_VECTOR_3D
		_:
			return PORT_TYPE_SCALAR

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		1:
			return 1.0
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

	if input_vars[0]:
		input = input_vars[0]

	var contrast: String = input_vars[1]
	return output_vars[0] + " = contrast(%s, %s);" % [input, contrast]
