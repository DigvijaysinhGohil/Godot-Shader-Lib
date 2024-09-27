@tool
class_name VisualShaderNodeAdjustmentHue extends ShaderLib

func _get_name() -> String:
	return "Hue"

func _get_category() -> String:
	return "Artistic/Adjustment"

func _get_description() -> String:
	return "Offsets the hue of input in by the amount of input offset."

func _get_return_icon_type() -> PortType:
	return PORT_TYPE_VECTOR_3D

func _get_input_port_count() -> int:
	return 2

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "in"
		_:
			return "offset"

func _get_input_port_type(port: int) -> PortType:
	match port:
		0:
			return PORT_TYPE_VECTOR_3D
		_:
			return PORT_TYPE_SCALAR

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		1:
			return 0.0
		_:
			return Vector3(1.0, 1.0, 1.0)

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "out"

func _get_output_port_type(port: int) -> PortType:
	return PORT_TYPE_VECTOR_3D

func _get_property_count() -> int:
	return 1

func _get_property_default_index(index: int) -> int:
	return 0

func _get_property_name(index: int) -> String:
	return "Range"

func _get_property_options(index: int) -> PackedStringArray:
	return ["Degrees", "Normalize"]

func _get_global_code(mode: Shader.Mode) -> String:
	return "#include \"res://addons/ShaderLib_%s/Artistic/Artistic.gdshaderinc\"" % [version]

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var range_index: int = get_option_index(0)
	var input: String = "vec3(1.0)"
	var offset: String = input_vars[1]

	if input_vars[0]:
		input = input_vars[0]

	return output_vars[0] + " = hue(%s, %s, %s);" % [input, offset, range_index]
