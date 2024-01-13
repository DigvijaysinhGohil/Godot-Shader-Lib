@tool
class_name VisualShaderNodeMathsNoiseSineWave extends VisualShaderNodeCustom

func _get_name() -> String:
	return "NoiseSineWave"

func _get_category() -> String:
	return "Maths/Wave"

func _get_description() -> String:
	return "Returns the sine of the value of input in. For variance, psuedo-random noise is added to the amplitude of the sine wave, within a range determined by input min max."

func _get_return_icon_type() -> VisualShaderNode.PortType:
	return PORT_TYPE_VECTOR_4D

func _get_input_port_count() -> int:
	return 2

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "in"
		1, _:
			return "min max"

func _get_input_port_type(port: int) -> VisualShaderNode.PortType:
	match port:
		0:
			return PORT_TYPE_VECTOR_4D
		1:
			return PORT_TYPE_VECTOR_2D
	return PORT_TYPE_SCALAR

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		1:
			return Vector2(0.0, 1.0)
		_:
			return null

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "out"

func _get_output_port_type(port: int) -> VisualShaderNode.PortType:
	return PORT_TYPE_VECTOR_4D

func _get_global_code(mode: Shader.Mode) -> String:
	var code: String = preload("NoiseSineWave.gdshaderinc").code
	return code

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var input: String = "vec4(0.0)"
	if input_vars[0]:
		input = input_vars[0]

	var min_max: String = input_vars[1]
	return output_vars[0] + " = noise_sine_wave(%s, %s);" % [input, min_max]
