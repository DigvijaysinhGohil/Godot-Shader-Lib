@tool
class_name VisualShaderNodeProceduralCheckerBoard extends ShaderLib

func _init() -> void:
	output_port_for_preview = 0

func _get_name() -> String:
	return "CheckerBoard"

func _get_category() -> String:
	return "Procedural"

func _get_description() -> String:
	return "Generates a checkerboard of alternating colors between inputs Color A and Color B based on input UV."

func _get_return_icon_type() -> VisualShaderNode.PortType:
	return PORT_TYPE_VECTOR_3D

func _get_input_port_count() -> int:
	return 4

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "uv"
		1:
			return "color A"
		2:
			return "color B"
		3:
			return "frequency"
	return ""

func _get_input_port_type(port: int) -> VisualShaderNode.PortType:
	match port:
		0, 3:
			return PORT_TYPE_VECTOR_2D
		1, 2:
			return PORT_TYPE_VECTOR_3D
	return PORT_TYPE_SCALAR

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		1:
			return Vector3(1.0, 1.0, 1.0)
		2:
			return Vector3(0.4, 0.4, 0.4)
		3:
			return Vector2(1.0, 1.0)
		_:
			return null

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "output"

func _get_output_port_type(port: int) -> VisualShaderNode.PortType:
	return PORT_TYPE_VECTOR_3D

func _get_global_code(mode: Shader.Mode) -> String:
	return "#include \"res://addons/ShaderLib_%s/Procedural/Procedural.gdshaderinc\"" % [version]

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var uv: String = "UV"

	if input_vars[0]:
		uv = input_vars[0]

	var color_a: String = input_vars[1]
	var color_b: String = input_vars[2]
	var frequency: String = input_vars[3]

	return output_vars[0] + " = checker_board(%s, %s.xyz, %s.xyz, %s);" % [uv, color_a, color_b, frequency]
