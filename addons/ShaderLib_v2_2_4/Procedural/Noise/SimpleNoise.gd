@tool
class_name VisualShaderNodeProceduralSimpleNoise extends ShaderLib

func _init() -> void:
	output_port_for_preview = 0

func _get_name() -> String:
	return "SimpleNoise"

func _get_category() -> String:
	return "Procedural/Noise"

func _get_description() -> String:
	return "Generates a simplex, or value noise based on input UV."

func _get_return_icon_type() -> VisualShaderNode.PortType:
	return PORT_TYPE_SCALAR

func _get_input_port_count() -> int:
	return 3

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "uv"
		1:
			return "scale"
		_:
			return "octaves"

func _get_input_port_type(port: int) -> VisualShaderNode.PortType:
	match port:
		0:
			return PORT_TYPE_VECTOR_2D
		1:
			return PORT_TYPE_SCALAR
		_:
			return PORT_TYPE_SCALAR_INT

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		1:
			return 10.0
		2:
			return 6
		_:
			return null

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "output"

func _get_output_port_type(port: int) -> VisualShaderNode.PortType:
	return PORT_TYPE_SCALAR

func _get_global_code(mode: Shader.Mode) -> String:
	return "#include \"res://addons/ShaderLib_%s/Procedural/Procedural.gdshaderinc\"" % [version]

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var uv: String = "UV"

	if input_vars[0]:
		uv = input_vars[0]

	var scale: String = input_vars[1]
	var octaves: String = input_vars[2]

	return output_vars[0] + " = simple_noise(%s, %s, %s);" % [uv, scale, octaves]
