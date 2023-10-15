@tool
class_name VisualShaderNodeMathsSawtoothWave extends VisualShaderNodeCustom

func _get_name() -> String:
	return "SawtoothWave"

func _get_category() -> String:
	return "Maths/Wave"

func _get_description() -> String:
	return "Returns a sawtooth wave from the value of input in. Resulting output values will be between -1 and 1."

func _get_return_icon_type() -> VisualShaderNode.PortType:
	return PORT_TYPE_VECTOR_4D

func _get_input_port_count() -> int:
	return 1

func _get_input_port_name(port: int) -> String:
	return "in"

func _get_input_port_type(port: int) -> VisualShaderNode.PortType:
	return PORT_TYPE_VECTOR_4D

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "out"

func _get_output_port_type(port: int) -> VisualShaderNode.PortType:
	return PORT_TYPE_VECTOR_4D

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var input: String = "vec4(0.0)"
	if input_vars[0]:
		input = input_vars[0]
	return output_vars[0] + " = 2.0 * (%s - floor(0.5 + %s));" % [input, input]
