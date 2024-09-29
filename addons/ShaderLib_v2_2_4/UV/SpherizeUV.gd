@tool
class_name VisualShaderNodeUVSpherize extends ShaderLib

func _get_name() -> String:
	return "Spherize"

func _get_category() -> String:
	return "UV"

func _get_description() -> String:
	return "Applies a spherical warping effect similar to a fisheye camera lens to the value of input UV."

func _get_return_icon_type() -> VisualShaderNode.PortType:
	return PORT_TYPE_VECTOR_2D

func _get_input_port_count() -> int:
	return 4

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "uv"
		1:
			return "center"
		2:
			return "strength"
		3:
			return "offset"
	return ""

func _get_input_port_type(port: int) -> VisualShaderNode.PortType:
	match port:
		0, 1, 3:
			return PORT_TYPE_VECTOR_2D
		2:
			return PORT_TYPE_SCALAR
	return PORT_TYPE_SCALAR

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		1:
			return Vector2(0.5, 0.5)
		2:
			return 10.0
		3:
			return Vector2(0.0, 0.0)
		_:
			return null

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "uv"

func _get_output_port_type(port: int) -> VisualShaderNode.PortType:
	return PORT_TYPE_VECTOR_2D

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
	var strength: String = input_vars[2]
	var offset: String = input_vars[3]

	return output_vars[0] + " = spherize_uv(%s, %s, %s, %s);" % [uv, center, strength, offset]
