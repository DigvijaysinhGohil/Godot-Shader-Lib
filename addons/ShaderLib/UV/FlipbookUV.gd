@tool
class_name VisualShaderNodeUVFlipbook extends VisualShaderNodeCustom

func _init() -> void:
	set_output_port_for_preview(0)

func _get_name() -> String:
	return "Flipbook"

func _get_category() -> String:
	return "UV"

func _get_description() -> String:
	return "Creates a flipbook, or texture sheet animation, of the UVs supplied to input UV."

func _get_return_icon_type() -> VisualShaderNode.PortType:
	return PORT_TYPE_VECTOR_2D

func _get_input_port_count() -> int:
	return 6

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "uv"
		1:
			return "rows"
		2:
			return "columns"
		3:
			return "start frame"
		4:
			return "end frame"
		5:
			return "anim speed"
	return ""

func _get_input_port_type(port: int) -> VisualShaderNode.PortType:
	match port:
		0:
			return PORT_TYPE_VECTOR_2D
		1, 2, 3, 4:
			return PORT_TYPE_SCALAR_INT
		5:
			return PORT_TYPE_SCALAR
	return PORT_TYPE_SCALAR

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		1, 2:
			return 1
		3, 4:
			return 0
		5:
			return 0.1
		_:
			return null

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "uv"

func _get_output_port_type(port: int) -> VisualShaderNode.PortType:
	return PORT_TYPE_VECTOR_2D

func _get_global_code(mode: Shader.Mode) -> String:
	var code: String = preload("FlipbookUV.gdshaderinc").code
	return code

func _is_available(mode: Shader.Mode, type: VisualShader.Type) -> bool:
	match mode:
		0, 1:
			return true
		_:
			return false

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var uv: String

	match mode:
		0, 1:
			uv = "UV"
		_:
			uv = "vec2(0.0)"

	if input_vars[0]:
		uv = input_vars[0]

	var rows: String = input_vars[1]
	var columns: String = input_vars[2]
	var start_frame: String = input_vars[3]
	var end_frame: String = input_vars[4]
	var anim_speed: String = input_vars[5]

	return output_vars[0] + " = flipbook_uv(%s, %s, %s, %s, %s, %s);" % [uv, rows, columns, start_frame, end_frame, anim_speed]
