@tool
class_name VisualShaderNodeProceduralCheckerBoard extends VisualShaderNodeCustom

func _init() -> void:
	_set_input_port_default_value(1, Vector3(1.0, 1.0, 1.0))
	_set_input_port_default_value(2, Vector3(0.4, 0.4, 0.4))
	_set_input_port_default_value(3, Vector2(1.0, 1.0))

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

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "output"

func _get_output_port_type(port: int) -> VisualShaderNode.PortType:
	return PORT_TYPE_VECTOR_3D

func _get_global_code(mode: Shader.Mode) -> String:
	var code: String = preload("CheckerBoard.gdshaderinc").code
	return code

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var uv: String = "UV"

	if input_vars[0]:
		uv = input_vars[0]

	var color_a: String = input_vars[1]
	var color_b: String = input_vars[2]
	var frequency: String = input_vars[3]

	return output_vars[0] + " = checker_board(%s, %s, %s, %s);" % [uv, color_a, color_b, frequency]
