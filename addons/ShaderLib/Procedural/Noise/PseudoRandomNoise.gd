@tool
class_name VisualShaderNodePseudoRandomNoise extends VisualShaderNodeCustom

func _init() -> void:
	output_port_for_preview = 0

func _get_name() -> String:
	return "PseudoRandomNoise"

func _get_category() -> String:
	return "Procedural/Noise"

func _get_description() -> String:
	return "Generates a pseudo random noise based on input seed."

func _get_return_icon_type() -> PortType:
	return PORT_TYPE_SCALAR

func _get_input_port_count() -> int:
	return 1

func _get_input_port_name(port: int) -> String:
	return "seed"

func _get_input_port_type(port: int) -> PortType:
	return PORT_TYPE_SCALAR

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		0:
			return 0.0
		_:
			return null

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "output"

func _get_output_port_type(port: int) -> PortType:
	return PORT_TYPE_SCALAR

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	return output_vars[0] + " = fract(sin(dot(UV.xy + vec2(%s), vec2(12.9898,78.233))) * 43758.5453123);" % input_vars[0]
