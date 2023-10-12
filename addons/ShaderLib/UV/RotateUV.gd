@tool
class_name VisualShaderNodeUVRotate extends VisualShaderNodeCustom

func _init() -> void:
	_set_input_port_default_value(1, Vector2(0.5, 0.5))
	_set_input_port_default_value(2, 0.0)
	_set_input_port_default_value(3, false)

	set_output_port_for_preview(0)

func _get_name() -> String:
	return "Rotate"

func _get_category() -> String:
	return "UV"

func _get_description() -> String:
	return "Rotates value of input UV around a reference point defined by input center by the amount of input rotation."

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
			return "rotation"
		3:
			return "use degrees"
	return ""

func _get_input_port_type(port: int) -> VisualShaderNode.PortType:
	match port:
		0, 1:
			return PORT_TYPE_VECTOR_2D
		2:
			return PORT_TYPE_SCALAR
		3:
			return PORT_TYPE_BOOLEAN
	return PORT_TYPE_SCALAR

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "uv"

func _get_output_port_type(port: int) -> VisualShaderNode.PortType:
	return PORT_TYPE_VECTOR_2D

func _get_global_code(mode: Shader.Mode) -> String:
	var code: String = preload("RotateUV.gdshaderinc").code
	return code

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var uv: String = "UV"

	if input_vars[0]:
		uv = input_vars[0]

	var center: String = input_vars[1]
	var rotation: String = input_vars[2]
	var use_degrees: String = input_vars[3]

	return output_vars[0] + " = rotate_uv(%s, %s, %s, %s);" % [uv, center, rotation, use_degrees]
