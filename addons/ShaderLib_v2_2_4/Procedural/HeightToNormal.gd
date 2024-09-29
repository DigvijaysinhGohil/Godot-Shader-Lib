@tool
class_name VisualShaderNodeProceduralHeightToNormal extends ShaderLib

func _get_name() -> String:
	return "HeightToNormal"

func _get_category() -> String:
	return "Procedural"

func _get_description() -> String:
	return "Generates a normal map from a height map."

func _get_return_icon_type() -> PortType:
	return PORT_TYPE_VECTOR_3D

func _get_input_port_count() -> int:
	return 3

func _get_input_port_name(port: int) -> String:
	match port:
		0:
			return "height map"
		1:
			return "uv"
		2:
			return "bump strength"
	return ""

func _get_input_port_type(port: int) -> PortType:
	match port:
		0:
			return PORT_TYPE_SAMPLER
		1:
			return PORT_TYPE_VECTOR_2D
		_:
			return PORT_TYPE_SCALAR

func _get_input_port_default_value(port: int) -> Variant:
	match port:
		2:
			return 8.0
		_:
			return null

func _get_output_port_count() -> int:
	return 1

func _get_output_port_name(port: int) -> String:
	return "normal"

func _get_output_port_type(port: int) -> PortType:
	return PORT_TYPE_VECTOR_3D

func _get_global_code(mode: Shader.Mode) -> String:
	return "#include \"res://addons/ShaderLib_%s/Procedural/Procedural.gdshaderinc\"" % [version]

func _get_code(input_vars: Array[String], output_vars: Array[String], mode: Shader.Mode, type: VisualShader.Type) -> String:
	var uv: String = "UV"
	if input_vars[1]:
		uv = input_vars[1]

	var sampler: String = input_vars[0]
	var bump: String = input_vars[2]

	return output_vars[0] + " = heigth_to_normal(%s, %s, %s);" % [sampler, uv, bump]
