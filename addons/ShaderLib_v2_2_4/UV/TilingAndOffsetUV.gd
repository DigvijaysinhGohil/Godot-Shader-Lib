@tool
class_name VisualShaderNodeUVTilingAndOffset extends ShaderLib

func _get_name() -> String:
	return "TilingAndOffset"

func _get_category() -> String:
	return "UV"

func _get_description() -> String:
	return "Tiles and offsets the value of input UV by the inputs Tiling and Offset respectively. This is commonly used for detail maps and scrolling textures over TIME."

func _get_return_icon_type() -> VisualShaderNode.PortType:
	return PORT_TYPE_VECTOR_2D

func _get_input_port_count() -> int:
	return 3

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "uv"
		1:
			return "tiling"
		2:
			return "offset"
	return ""

func _get_input_port_type(port: int) -> VisualShaderNode.PortType:
	match port:
		0, 1, 2:
			return PORT_TYPE_VECTOR_2D
	return PORT_TYPE_SCALAR

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		1:
			return Vector2(1.0, 1.0)
		2:
			return Vector2(0.0, 0.0)
		_:
			return null

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "uv"

func _get_output_port_type(port: int) -> VisualShaderNode.PortType:
	return PORT_TYPE_VECTOR_2D

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var uv: String

	match mode:
		0, 1:
			uv = "UV"
		_:
			uv = "vec2(0.0)"

	if input_vars[0]:
		uv = input_vars[0]

	var tiling: String = input_vars[1]
	var offset: String = input_vars[2]

	return output_vars[0] + " = %s * %s + %s;" % [uv, tiling, offset]
