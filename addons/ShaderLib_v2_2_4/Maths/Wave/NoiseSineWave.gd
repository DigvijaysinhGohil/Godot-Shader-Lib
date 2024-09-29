@tool
class_name VisualShaderNodeMathsNoiseSineWave extends ShaderLib

func _get_name() -> String:
	return "NoiseSineWave"

func _get_category() -> String:
	return "Maths/Wave"

func _get_description() -> String:
	return "Returns the sine of the value of input in. For variance, psuedo-random noise is added to the amplitude of the sine wave, within a range determined by input min max."

func _get_return_icon_type() -> VisualShaderNode.PortType:
	var vector_index: int = get_option_index(0)
	match vector_index:
		0:
			return PORT_TYPE_SCALAR
		1:
			return PORT_TYPE_VECTOR_2D
		2:
			return PORT_TYPE_VECTOR_3D
		_:
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
			var vector_index: int = get_option_index(0)
			match vector_index:
				0:
					return PORT_TYPE_SCALAR
				1:
					return PORT_TYPE_VECTOR_2D
				2:
					return PORT_TYPE_VECTOR_3D
				_:
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
	var vector_index: int = get_option_index(0)
	match vector_index:
		0:
			return PORT_TYPE_SCALAR
		1:
			return PORT_TYPE_VECTOR_2D
		2:
			return PORT_TYPE_VECTOR_3D
		_:
			return PORT_TYPE_VECTOR_4D

func _get_property_count() -> int:
	return 1

func _get_property_default_index(index: int) -> int:
	return 0

func _get_property_name(index: int) -> String:
	return ""

func _get_property_options(index: int) -> PackedStringArray:
	return ["Vector1", "Vector2", "Vector3", "Vector4"]

func _get_global_code(mode: Shader.Mode) -> String:
	return "#include \"res://addons/ShaderLib_%s/Maths/Maths.gdshaderinc\"" % [version]

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var input: String
	var vector_index: int = get_option_index(0)
	match vector_index:
		0:
			input = "0.0"
		1:
			input = "vec2(0.0)"
		2:
			input = "vec3(0.0)"
		_:
			input = "vec4(0.0)"

	if input_vars[0]:
		input = input_vars[0]

	var min_max: String = input_vars[1]

	match vector_index:
		0:
			return output_vars[0] + " = noise_sine_wave(vec4(%s), %s).x;" % [input, min_max]
		1:
			return output_vars[0] + " = noise_sine_wave(vec4(%s, 0.0, 0.0), %s).xy;" % [input, min_max]
		2:
			return output_vars[0] + " = noise_sine_wave(vec4(%s, 0.0), %s).xyz;" % [input, min_max]
		_:
			return output_vars[0] + " = noise_sine_wave(%s, %s);" % [input, min_max]
