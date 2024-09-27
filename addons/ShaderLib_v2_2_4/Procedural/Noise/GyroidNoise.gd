@tool
class_name VisualShaderNodeProceduralGyroidNoise extends ShaderLib

func _init() -> void:
	output_port_for_preview = 0

func _get_name() -> String:
	return "GyroidNoise"

func _get_category() -> String:
	return "Procedural/Noise"

func _get_description() -> String:
	return "Generates a gyroid noise based on input UV."

func _get_return_icon_type() -> PortType:
	return PORT_TYPE_SCALAR

func _get_input_port_count() -> int:
	return 5

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "uv"
		1:
			return "scale"
		2:
			return "ratio"
		3:
			return "height"
		_:
			return "thickness"

func _get_input_port_type(port: int) -> PortType:
	match port:
		0, 2:
			return PORT_TYPE_VECTOR_2D
		_:
			return PORT_TYPE_SCALAR

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		1:
			return 2.0
		2:
			return Vector2(1, 1)
		3:
			return 0.5
		4:
			return 0.0
		_:
			return null

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "output"

func _get_output_port_type(port: int) -> PortType:
	return PORT_TYPE_SCALAR

func _get_global_code(mode: Shader.Mode) -> String:
	return "#include \"res://addons/ShaderLib_%s/Procedural/Procedural.gdshaderinc\"" % [version]

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var uv: String = "UV"

	if input_vars[0]:
		uv = input_vars[0]

	var scale: String = input_vars[1]
	var ratio: String = input_vars[2]
	var height: String = input_vars[3]
	var thickness: String = input_vars[4]

	return output_vars[0] + " = gyroid_noise(%s, %s, %s, %s, %s);" % [uv, scale, ratio, height, thickness]
