@tool
class_name VisualShaderNodeUVRotate extends ShaderLib

func _get_name() -> String:
	return "Rotate"

func _get_category() -> String:
	return "UV"

func _get_description() -> String:
	return "Rotates value of input UV around a reference point defined by input center by the amount of input rotation."

func _get_return_icon_type() -> VisualShaderNode.PortType:
	return PORT_TYPE_VECTOR_2D

func _get_input_port_count() -> int:
	return 3

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "uv"
		1:
			return "center"
		2:
			return "rotation"
	return ""

func _get_input_port_type(port: int) -> VisualShaderNode.PortType:
	match port:
		0, 1:
			return PORT_TYPE_VECTOR_2D
		2:
			return PORT_TYPE_SCALAR
	return PORT_TYPE_SCALAR

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		1:
			return Vector2(0.5, 0.5)
		2:
			return 0.0
		_:
			return null

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "uv"

func _get_output_port_type(port: int) -> VisualShaderNode.PortType:
	return PORT_TYPE_VECTOR_2D

func _get_property_count() -> int:
	return 1

func _get_property_default_index(index: int) -> int:
	return 0

func _get_property_name(index: int) -> String:
	return "Units"

func _get_property_options(index: int) -> PackedStringArray:
	return ["Degrees", "Radians"]

func _get_global_code(mode: Shader.Mode) -> String:
	return "#include \"res://addons/ShaderLib_%s/UV/UV.gdshaderinc\"" % [version]

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var uv: String

	match mode:
		0, 1:
			uv = "UV"
		_:
			uv = "vec2(0.0)"

	if input_vars[0]:
		uv = input_vars[0]

	var center: String = input_vars[1]
	var rotation: String = input_vars[2]
	var use_degrees: String = "true" if get_option_index(0) == 0 else "false"

	return output_vars[0] + " = rotate_uv(%s, %s, %s, %s);" % [uv, center, rotation, use_degrees]
