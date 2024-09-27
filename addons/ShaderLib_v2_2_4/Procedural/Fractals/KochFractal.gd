@tool
class_name VisualShaderNodeProceduralKochFractal extends ShaderLib

func _init() -> void:
	output_port_for_preview = 0

func _get_name() -> String:
	return "KochFractal"

func _get_category() -> String:
	return "Procedural/Fractals"

func _get_description() -> String:
	return "Generates an koch curve similar to ice fractal shape based on input UV at the size specified by inputs width and height."

func _get_return_icon_type() -> PortType:
	return PORT_TYPE_SCALAR

func _get_input_port_count() -> int:
	return 5

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "uv"
		1:
			return "thickness"
		2:
			return "iterations"
		3:
			return "widht"
		_:
			return "height"

func _get_input_port_type(port: int) -> PortType:
	match port:
		0:
			return PORT_TYPE_VECTOR_2D
		2:
			return PORT_TYPE_SCALAR_INT
		_:
			return PORT_TYPE_SCALAR

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		1, 3, 4:
			return 1.0
		2:
			return 3
		_:
			return null

func _get_output_port_count() -> int:
	return 2

func _get_output_port_name(port: int) -> String:
	match port:
		0:
			return "out"
		_:
			return "uv"

func _get_output_port_type(port: int) -> PortType:
	match port:
		1:
			return PORT_TYPE_VECTOR_2D
		_:
			return PORT_TYPE_SCALAR

func _get_global_code(mode: Shader.Mode) -> String:
	return "#include \"res://addons/ShaderLib_%s/Procedural/Procedural.gdshaderinc\"" % [version]

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var uv: String = "UV"

	if input_vars[0]:
		uv = input_vars[0]

	var thickness: String = input_vars[1]
	var iterations: String = input_vars[2]
	var width: String = input_vars[3]
	var height: String = input_vars[4]

	return output_vars[0] + " = koch_fractal(%s, %s, %s, %s, %s, %s);" % [uv, thickness, iterations, width, height, output_vars[1]]
